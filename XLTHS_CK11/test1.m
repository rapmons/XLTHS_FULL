[y,Fs] = audioread('\45MDV.wav'); % Fetch the signal.

% Signal spectral analysis using Fast Fourier Transform Function.
F0_3 = FFT(y,Fs,2^11);

plot(F0_3,'*');
xlabel('Frequency(Hz)');
ylabel('Signal Spectral');
title('Calculated F0 - FFT - After smoothing');
m=[];

for i= 1:length(F0_3)
    if(F0_3(i)> 0)
    m=[m F0_3(i)];
   
    end
end
mean(m)
std(m)
 function [w] = Hamming(L)
    % The function is used for creating the Hamming window function of length L.
    % Input is L - the length of window.
    % The output is w, which is an array containing all calculated value of Hamming window function
    for i = 0:L-1
        w(i+1) = 0.54 - 0.46*cos((2*pi*i)/L);
    end
 end
 function [f0] = FFT(signal,fs,N)
    % This function is used for finding the basic frequency F0 of a signal with spectral analysis using FFT
    % signal is the input signal.
    % fs is sampling frequency.
    % N is FFT points.
    % The output is F0, which is an array containing all calculated basic frequencies of every frame.
    
        frame_len = round(0.02*fs); % Length of frame (20ms)
    half = round(frame_len/2); % For overlapping frame
    h = hamming(frame_len); % Hamming window function
 
    for k = 1 : length(signal)/half -1 % (length(signal)/half -1) = number of frames.
        width = (k-1)*half + 1:(frame_len + (k-1)*half); % Beginning point to ending point of frame.
        frame = h.*signal(width); % Create frame.
        
        % Frame's spectral analysis using fft() function of Matlab's library.
        P2 = abs(fft(frame,N)); % The two-sided spectrum P2
      % The single-sided spectrum P1
        P1=P2(1:length(P2)/2+1);
       
        freq = linspace(0,fs/2,length(P1)); % Create frequency vector.
        
        local_maxima = zeros(1,N); % Create local maxima vector, which will contain all local maxima.
        for i = 2:length(P1)-1
            plotPoint = 0;
            if (P1(i-1) < P1(i) && P1(i) > P1(i+1)) % If P1(i) is a local maxima.
                plotPoint = P1(i); 
            end
            local_maxima(i) = plotPoint; % Then store P1(i) to local maxima vector.
        end
        
        pos = []; % Position vector.
        for i = 1:length(local_maxima)
            if (local_maxima(i)~=0) % If the maxima's amplitude is greater than threshold = 2 
                pos = [pos i]; % Then store its position index to pos vector.
            end
        end
        f1=[];
        k1=0;
          frame_max = max(frame); % Global maximum of frame.
        if (frame_max > 0.03) % Remove the noise by limiting the amplitude of signal in frame.
              for i=1:length(pos)-1
               lag1 = freq(pos(i)); % Frequency 1 of local maxima 1st.
              
                if (lag1 > 70) && (lag1 < 400) % If frequency 1 is in the range
               f1=[f1 lag1];
               k1=i;
               break;
                end
              end
              l=0;
              while(freq(pos(k1+l+1))<2000)
                  is=k1+l+1;
                  lag2 = freq(pos(is))-freq(pos(k1));
                   if (lag2 > 70) && (lag2 < 400) % If frequency 2 is in the range
                        f1 = [f1 lag2]; 
                        k1=k1+l+1;
                    else 
                      l=l+1; 
                   end 
              end
             if(length(f1)<5)
                 f0(k)=mean(f1);
             else
            f10=MedFiltering(f1,5);
            f0(k)=mean(f10)+std(f10);
             end
        else
            f0(k)=-inf;
        end
    end

 end
 function [res] = MedFiltering(F0,N)
    % This function is used for smoothing obtained F0 result.
    % F0 is the basic frequency vector before smoothing.
    % N is input's dememsion (level of F0 vector).
    % The output is res, which is an array containing F0 vector after smoothing. 
    
    res = F0; % Result vector.
    for k = 1:length(F0)
        % Create an array containing current filtering value.
        % The middle element of array is the value that need to be filtered.
        if (k < ceil(N/2))
            array = [zeros(1,ceil(N/2)-k) F0(1:N-ceil(N/2)+k)]; 
        else
            if (k > length(F0) - ceil(N/2) + 1)
                array = [F0(k-ceil(N/2)+1:end) zeros(1,k-length(F0)+ceil(N/2)-1)];
            else
                array = [F0(k-ceil(N/2)+1:k+ceil(N/2)-1)];
            end
        end
        
        % Sort the array - Bubble Sort.
        for j = 0 : N-1
            for i = 1: N-j-1
                if (array(i) > array(i+1))
	      % Swap array(i) with array(i+1)
                    temp = array(i);
                    array(i) = array(i+1);
                    array(i+1) = temp;
                end
            end
        end
        res(k) = array(ceil(N/2)); % Replacing the value that need to be filtered with the array's middle element.
    end
 end
 