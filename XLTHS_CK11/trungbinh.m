
close all;
 
void('\01MDA.wav',1);
% void('\02FVA.wav',2);
 %void('\03MAB.wav',3);
 %void('\06FTB.wav',4);
%doc tin hieu
function void(tin , w)
[x,fs]= audioread(tin);

frame=[];

    frame_len = round(0.02*fs); 
    frame_shitf = round(0.01*fs); 
    h = hamming(frame_len); 
    for k = 1 : length(x)/frame_shitf -1 
        width = (k-1)*frame_shitf + 1:(frame_len + (k-1)*frame_shitf); 
        a= max(h.*x(width)); 
      frame=[frame a];
    end

  
    
   
    
   
    

   
           if(w==1)
               msm= [0.45 0.81 1.53 1.85 2.69 2.86 3.78 4.15 4.84 5.14 ];
               for i=1:length(msm)-1

              % H(i)=  mean(frame(round(fs * msm(i))):round(fs * msm(i+1)));
    
               end
               i=1;
               K=0;
               m=0;
   while (i<=length(H))
       
       K= [K H(i)];
       i=i+2;
      
   end
  mean(K)
  std(K)
   j=2;
               L=0;
              n=0; 
   while (j<=length(H))
       
       L= [L H(j)];
       j=j+2;
      
   end
  mean(L)
  std(L)
           end
   
           if(w==2)
               msm=[0.83 1.37 2.09 2.6 3.57 4.0 4.76 5.33 6.18 6.68 ];%studio_f1
               for i=1:length(msm)-1

  %H(i)=  mean(  frame(floor(fs * msm(i)):floor(fs * msm(i+1))));
    
               end
               i=1;
               K=0;
               m=0;
    while (i<=length(H))
       
       K= [K H(i)];
       i=i+2;
      
   end
  mean(K)
  std(K)
   j=2;
               L=0;
              n=0; 
   while (j<=length(H))
       
       L= [L H(j)];
       j=j+2;
      
   end
  mean(L)
  std(L)
    
           end
           if(w==3)
               msm=[1.03 1.42 2.46 2.8 4.21 4.52 6.81 7.14 8.22 8.5]; %phone_m1
               for i=1:length(msm)-1

 % H(i)=  mean(  frame(floor(fs * msm(i)):floor(fs * msm(i+1))));
    
               end
               i=1;
               K=0;
               m=0;
    while (i<=length(H))
       
       K= [K H(i)];
       i=i+2;
      
   end
  mean(K)
  std(K)
   j=2;
               L=0;
              n=0; 
   while (j<=length(H))
       
       L= [L H(j)];
       j=j+2;
      
   end
  mean(L)
  std(L)
   
    
           end
           if(w==4)
              msm=[1.52 1.92 3.91 4.35 6.18 6.60 8.67 9.14 10.94 11.33 ];%phone_f1
               for i=1:length(msm)-1

        %  H(i)=  mean(  frame(floor(fs * msm(i)):floor(fs * msm(i+1))));
    
               end
               i=1;
               K=0;
               m=0;
   while (i<=length(H))
       
       K= [K H(i)];
       i=i+2;
      
   end
  mean(K)
  std(K)
   j=2;
               L=0;
              n=0; 
   while (j<=length(H))
       
       L= [L H(j)];
       j=j+2;
      
   end
  mean(L)
  std(L)
   
           end
       
   
end

