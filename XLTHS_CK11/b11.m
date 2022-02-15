clear all; clc; close all;

waveFile='/45MDV.wav';                            
[signal, fs]=audioread(waveFile);
msm=[0.88 1.34 2.35 2.82 3.76 4.13 5.04 5.5 6.41 6.79];
 is=1;
  while(is<10)
u=filter([1 -.99],1,signal(msm(is)*fs:msm(is+1)*fs)); 
  is=is+2;
wlen=length(u);                                  % Chiều dài khung
cepstL=40;                                        % Chiều rộng của hàm cửa sổ trên tần số nghịch đảo
wlen2=round(wlen/2);               
freq=(0:wlen2-1)*fs/wlen;                        % Tính thang tần số trong miền tần số
u2=u.*hamming(wlen);		                     % Chức năng cửa sổ tín hiệu
U=fft(u2);                                       % Tính theo công thức (9-2-1)
U_abs=log(abs(U(1:wlen2)));                      % Tính theo công thức (9-2-2)
Cepst=ifft(U_abs);                               % Tính theo công thức (9-2-3)
cepst=zeros(1,wlen2);           
cepst(1:cepstL)=Cepst(1:cepstL);                 % Tính theo công thức (9-2-5)
cepst(end-cepstL+2:end)=Cepst(end-cepstL+2:end);
spect=real(fft(cepst));                          % Tính theo công thức (9-2-6)

%[Loc,Val]=findpeaks(spect);                      % Tìm đỉnh cao
[Val,Loc]=findpeaks(spect);
FRMNT=freq(Loc);  
figure;
hold on; grid;
plot(freq,spect,'k','linewidth',2); 
xlabel('tần số/Hz'); ylabel('Biên độ/dB');
title('Phổ tín hiệu, đường bao và đỉnh cộng hưởng')
for i=1:3
 fprintf('%5.2f\n',FRMNT(i))
end
for k=1 : 5
    plot(freq(Loc(k)),Val(k),'kO','linewidth',2);
    line([freq(Loc(k)) freq(Loc(k))],[-6 Val(k)],'color','k',...
        'linestyle','-.','linewidth',2);
end
      fprintf("tan so\n")
   end     


