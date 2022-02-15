[signal,Fs] = audioread('./09MPD/a.wav'); 
      t=length(signal)*1/fs
        c=v_melcepst(signal,fs);
        [l,m,n]=size(c)
        k=[];
        % hàng
     for i=1:m
       k=[k c(i)];  
     end
     k;
 u=[];
 % cột
 for i=0:l-1
     u=[u c(i*m+1)];
 end
 u  ;      