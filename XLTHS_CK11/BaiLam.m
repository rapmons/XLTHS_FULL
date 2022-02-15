function BaiLam(x, Fs, timeV)
    t = (0:length(x)-1)/Fs; 
    frameSize= floor(0.03*Fs);
    separateFrame= floor(frameSize/2);
    frameNumber= floor(length(x)/separateFrame-1);

    for iterater=1 : frameNumber-1
        frame = x(1+separateFrame*(iterater-1) : frameSize+(iterater-1)*separateFrame);
        STE(iterater)= sum(frame.^2);    
    end
    timeSTE= (0 : 0.03/2 : separateFrame*(frameNumber-1)/Fs);
    
    %standar signal
    x = x./max(abs(x));
    STE = STE./max(STE);
 
    threshold = 0.0045;
    
    count=1; iterater=1;
    speech=0; silence=0;
    while(iterater <= length(STE))
        if STE(iterater) > threshold && speech==0
            time(count) = (iterater-1)*0.03/2;
            speech=1;
            count = count + 1;
            silence=0;
        end
        if STE(iterater) < threshold && silence==0
            time(count) = (iterater-1)*0.03/2;
            silence=1;
            count = count +1;
            speech=0;
        end
        if iterater==length(STE)
            time(count) = length(STE)*0.03/2;
        end
        iterater=iterater+1;
    end
   i=1;
    while i <= length(time)
        j = i+1;
        if (time(j)-time(i)) >= 0.3
            timeV = cat(2, timeV, [time(i), time(j)]);
        end
        i= i+2;
    end
    output(x, Fs, timeV)
end