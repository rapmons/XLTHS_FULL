close all;
 

figure;
[y,Fs] = audioread('\30FTN.wav'); % Fetch the signal.
subplot(4,1,1);
t=(1/Fs):(1/Fs):(length(y)/Fs);
    plot(t,y);
% Signal spectral analysis using Fast Fourier Transform Function.
F0_3 = FFT(y,Fs,2^11);
       y1=y(0.59*Fs:0.97*Fs);
      
       y2=y(0.97*Fs:1.76*Fs);
       
        P2 = abs(fft(y1(1:(Fs*.035)))); 
        P3=P2(1:length(P2)/2+1);
        P1=10*log(P3);
        tt=linspace(1/Fs,Fs/2,length(P1));
        subplot(4,1,2);
         plot(tt,P1);
        P21 = abs(fft(y2(1:(Fs*.035)))); 
        P31=P21(1:length(P2)/2+1);
        P11=10*log(P31);
       tt1=linspace(1/Fs,Fs/2,length(P11));
        subplot(4,1,3);
         plot(tt1,P11);
   subplot(4,1,4);

plot(F0_3,'.');
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

figure;


[y,Fs] = audioread('\42FQT.wav'); % Fetch the signal.
subplot(4,1,1);
t=(1/Fs):(1/Fs):(length(y)/Fs);
    plot(t,y);
% Signal spectral analysis using Fast Fourier Transform Function.
F0_3 = FFT(y,Fs,2^11);
       y1=y(0.46*Fs:0.99*Fs);
      
       y2=y(0.99*Fs:1.58*Fs);
       
        P2 = abs(fft(y1(1:(Fs*.035)))); 
        P3=P2(1:length(P2)/2+1);
        P1=10*log(P3);
        tt=linspace(1/Fs,Fs/2,length(P1));
        subplot(4,1,2);
         plot(tt,P1);
        P21 = abs(fft(y2(1:(Fs*.035)))); 
        P31=P21(1:length(P2)/2+1);
        P11=10*log(P31);
       tt1=linspace(1/Fs,Fs/2,length(P11));
        subplot(4,1,3);
         plot(tt1,P11);
   subplot(4,1,4);

plot(F0_3,'.');
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
figure;


[y,Fs] = audioread('\44MTT.wav'); % Fetch the signal.
subplot(4,1,1);
t=(1/Fs):(1/Fs):(length(y)/Fs);
    plot(t,y);
% Signal spectral analysis using Fast Fourier Transform Function.
F0_3 = FFT(y,Fs,2^11);
       y1=y(0.93*Fs:1.42*Fs);
      
       y2=y(1.42*Fs:2.59*Fs);
       
        P2 = abs(fft(y1(1:(Fs*.035)))); 
        P3=P2(1:length(P2)/2+1);
        P1=10*log(P3);
        tt=linspace(1/Fs,Fs/2,length(P1));
        subplot(4,1,2);
         plot(tt,P1);
        P21 = abs(fft(y2(1:(Fs*.035)))); 
        P31=P21(1:length(P2)/2+1);
        P11=10*log(P31);
       tt1=linspace(1/Fs,Fs/2,length(P11));
        subplot(4,1,3);
         plot(tt1,P11);
   subplot(4,1,4);

plot(F0_3,'.');
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

 figure;

[y,Fs] = audioread('\45MDV.wav'); % Fetch the signal.
subplot(4,1,1);
t=(1/Fs):(1/Fs):(length(y)/Fs);
    plot(t,y);
% Signal spectral analysis using Fast Fourier Transform Function.
F0_3 = FFT(y,Fs,2^11);
       y1=y(0.88*Fs:1.34*Fs);
      
       y2=y(1.34*Fs:2.35*Fs);
       
        P2 = abs(fft(y1(1:(Fs*.035)))); 
        P3=P2(1:length(P2)/2+1);
        P1=10*log(P3);
        tt=linspace(1/Fs,Fs/2,length(P1));
        subplot(4,1,2);
         plot(tt,P1);
        P21 = abs(fft(y2(1:(Fs*.035)))); 
        P31=P21(1:length(P2)/2+1);
        P11=10*log(P31);
       tt1=linspace(1/Fs,Fs/2,length(P11));
        subplot(4,1,3);
         plot(tt1,P11);
   subplot(4,1,4);

plot(F0_3,'.');
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
 


 
 function [f0] = FFT(signal,fs,N)
   H=nguong(signal,fs);
    frame_len = round(0.02*fs); 
    frame_shitf = round(0.01*fs); 
    h = hamming(frame_len); 
    for k = 1 : length(signal)/frame_shitf -1 
        if (H(k)==1) 
        width = (k-1)*frame_shitf + 1:(frame_len + (k-1)*frame_shitf); 
        frame = h.*signal(width); 
        P2 = abs(fft(frame,N));
     
        P3=P2(1:length(P2)/5+1);
        P1=10*log(P3);
        freq = linspace(0,fs/2,length(P1)); 
        loc_max = zeros(1,N); 
        for i = 2:length(P1)-1
            plotPoint = 0;
            if (P1(i-1) < P1(i) && P1(i) > P1(i+1))
                plotPoint = P1(i); 
            end
            loc_max(i) = plotPoint; 
        end
        
        pos = []; 
        for i = 1:length(loc_max)
            if (loc_max(i)~=0) 
                pos = [pos i]; 
            end
        end
        f1=[];
        k1=0;
        
       
              for i=1:length(pos)-1
               lag1 = freq(pos(i)); 
              
                if (lag1 > 75) && (lag1 < 350) 
               f1=[f1 lag1];
               k1=i;
               break;
                end
              end
              l=0;
              while(freq(pos(k1+l+1))<2000)
                  is=k1+l+1;
                  lag2 = freq(pos(is))-freq(pos(k1));
                   if (lag2 > 70) && (lag2 < 400)
                        f1 = [f1 lag2]; 
                        k1=k1+l+1;
                    else 
                      l=l+1; 
                   end 
              end
             for i=1:length(f1)-1
                 for j=i+1:length(f1)
                     if(f1(i)>f1(j))
                         tem= f1(i);
                         f1(i)=f1(j);
                         f1(j)=tem;
                     end
                 end
                 
             end
             
             m=[];
             if(length(f1)<5)
                 f0(k)=mean(f1)-0.5*std(f1);
             else
             is=0;
             is1=max(f1)-60;
             for i= length(f1)-4:length(f1)
               if(f1(i)>is1)
                  is=is+1;
               end
             end
             if(is==3)
                 m=[m f1(length(f1)-4:length(f1))];
             else
                m=[m f1(1+round(length(f1)/4):length(f1)-round(length(f1)/4))];
                   
               
             end
             if(std(m)>20)
             f0(k)= mean(m)+std(f1);
             else
                 
                f0(k)= mean(m); 
             end
             end
             
        else
            f0(k)=0;
        end
       
    
    end
 end
 function [Ha] = nguong(x,fs)
 

leng_x= length(x);

frame_time= 0.02; 
frame_sample = round(fs * frame_time);
 frame_sh = round(0.01*fs); 
frame_num = floor(length(x)/frame_sh -1);
s=[zeros(1,frame_num)];
s1=[zeros(1,frame_num)];


for i=1:frame_num
    begin = (i-1)*frame_sh + 1;
    finish =  frame_sample + (i-1)*frame_sh;
    %tinh STE
    for m= begin: finish
      s(i)= s(i)+x(m).*x(m);
    end
   
end
 
  STE = 0;
  
    for i = 1 : length(s)
       
        mi = min(s);%tim gia tri min 
         an = max(s)-min(s);%tinh hieu cua max va min

        STE(i) = (s(i)-mi)/an;
       
    end
    for k= 1: frame_num
        
       if((STE(k)>0.0115))
          Ha(k)=1;
       else
           Ha(k)=0;
       end
    end
    
 end
 
 