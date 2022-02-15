
close all;
 [y,Fs] = audioread('\44MTT.wav');

vepho(y,Fs);

function vepho(signal , fs)
    N=2^12;
   H=nguong(signal,fs);
    frame_len = round(0.02*fs); 
    frame_shitf = round(0.01*fs); 
    h = hamming(frame_len);
    mk=0;
    k=1;
    while(mk<1000)
        
        if (H(k)==1) 
        width = (k-1)*frame_shitf + 1:(frame_len + (k-1)*frame_shitf); 
        frame = h.*signal(width); 
        P2 = abs(fft(frame,N));
     
        P1=P2(1:length(P2)/10);
       % P1=10*log(P3);
        freq = linspace(0,fs/10,length(P1)); 
        
       [pos, loc_max] = findpeaks(P1,freq,'MinPeakDistance',70,'MinPeakHeight',max(P1)/8);
       findpeaks(P1,freq)

        text(loc_max,pos,num2str((1:numel(pos))'))
       mk=10000;
        else
            k=k+1;
        end
    end
  
end

function void(tin , w)
[x,fs]= audioread(tin);
%tinh do dai tin hieu
%sound(x,fs);
leng_x= length(x);
t= leng_x./fs;
frame_time= 0.02; %10ms
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
 % Bieu dien STE cung do dai voi tin hieu am thanh
  STE = 0;
  
    for i = 1 : length(s)
        len = length(STE);
        mi = min(s);%tim gia tri min 
         an = max(s)-min(s);%tinh hieu cua max va min

        STE(len : len + frame_sh) = (s(i)-mi)/an;
       
    end
 
  
    
    H_SR=0;
   ms =0;
    for i= 1: length(STE)
        
       if((STE(i)>0.0115))
          H_SR(i)=1; 
        
       end
    end
     subplot(3,1,1);
     hold on
     title("STE");
     plot((1:leng_x)./fs,x);
       hold on
plot((1:length(STE))./fs,STE);

      xlabel('Time (s)');
       subplot(3,1,2);
        hold on
     
     plot((1:leng_x)./fs,x);
      xlabel('Time (s)');
      if(w==1)
           hold on
                title("30FTN");
      end
      if(w==2)
           hold on
                title("42FQT");
      end
      if(w==3)
           hold on
                title("44MTT");
      end
      if(w==4)
           hold on
                title("45MDV");
      end
    for i= 1:length(H_SR)-1
        if((H_SR(i)+H_SR(i+1))==1&& H_SR(i)==0)
            
            hold on;
          xline(i./fs,'Color', 'b', 'LineWidth', 1);  
        end
        if((H_SR(i)+H_SR(i+1))==1&& H_SR(i)==1)
            hold on;
          xline(i./fs,'Color', 'b', 'LineWidth', 1);  
        end
    end

    hold on;
          xline(length(H_SR)./fs,'Color', 'b', 'LineWidth', 1);  
       subplot(3,1,3);
    plot((1:leng_x)./fs,x);
      xlabel('Time (s)');
           if(w==1)
               hold on
                title("30FTN(chuan)");
               msm= [0.59 0.97 1.76 2.11 3.44 3.77 4.7 5.13 5.96 6.28  ];
               for i=1:length(msm)
       
         hold on;
   xline(msm(i),'Color', 'r', 'LineWidth', 1);
    end
    
 
   end
           if(w==2)
                hold on
                title("42FQT(chuan)");
               msm=[0.46 0.99 1.56 2.13 2.51 2.93 3.79 4.38 4.77 5.22 ];%studio_f1
               for i=1:length(msm)
        
         hold on;
   xline(msm(i),'Color', 'r', 'LineWidth', 1);
    end
   
   
 
           end
           if(w==3)
                hold on
                title("44MTT(chuan)");
               msm=[0.93 1.42 2.59 3.0 4.71 5.11 6.26 6.66 8.04 8.39]; %phone_m1
               for i=1:length(msm)
        
         hold on;
   xline(msm(i),'Color', 'r', 'LineWidth', 1);
    end
   
   
  
           end
           if(w==4)
                hold on
                title("45MDV(chuan)");
              msm=[0.88 1.34 2.35 2.82 3.76 4.13 5.04 5.5 6.41 6.79];%phone_f1
               for i=1:length(msm)
        
         hold on;
   xline(msm(i),'Color', 'r', 'LineWidth', 1);
    end
   
  
 
           end
       
   
end
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
     
        P3=P2(1:length(P2)/10);
        P1=10*log(P3);
        freq = linspace(0,fs/10,length(P1)); 
        
       [pos, loc_max] = findpeaks(P1,freq,'MinPeakDistance',70,'MinPeakHeight',max(P1)/8);
       f1=[];
       if(length(loc_max)>1)
        for i=2:length(loc_max)
            lag= loc_max(i)-loc_max(i-1);
            if(lag<400)
                f1=[f1 lag];
            end
        end
       else
           f0(k)=0;
       end
       f0(k)=mean(f1);
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

