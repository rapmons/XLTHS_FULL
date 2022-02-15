

figure; 
[s, fs] = audioread('./03MAB/a.wav');
t1 = 0:1/fs:length(s)/fs - 1/fs;
subplot(521); plot(t1, s); xlabel("Time (s)"); subplot(522);
spectrogram(s,(5*10^(-3)*fs),round(2*10^(-3)*fs) , 1024, fs, "yaxis")
[s, fs] = audioread('./03MAB/e.wav');
t2 = 0:1/fs:length(s)/fs - 1/fs;
subplot(523); plot(t2, s); xlabel("Time (s)"); subplot(524);
spectrogram(s,(5*10^(-3)*fs),round(2*10^(-3)*fs) , 1024, fs, "yaxis")
[s, fs] = audioread('./03MAB/i.wav');
t3 = 0:1/fs:length(s)/fs - 1/fs;
subplot(525); plot(t3, s); xlabel("Time (s)"); subplot(526);
spectrogram(s,(5*10^(-3)*fs),round(2*10^(-3)*fs) , 1024, fs, "yaxis")
[s, fs] = audioread('./03MAB/o.wav');
t4 = 0:1/fs:length(s)/fs - 1/fs;
subplot(527); plot(t4, s); xlabel("Time (s)"); subplot(528);
spectrogram(s,(5*10^(-3)*fs),round(2*10^(-3)*fs) , 1024, fs, "yaxis")
[s, fs] = audioread('./03MAB/u.wav');
t5 = 0:1/fs:length(s)/fs - 1/fs;
subplot(529); plot(t5, s); xlabel("Time (s)"); subplot(5,2,10);
spectrogram(s,(5*10^(-3)*fs),round(2*10^(-3)*fs) , 1024, fs, "yaxis")
figure; 
[s, fs] = audioread('./06FTB/a.wav');
t1 = 0:1/fs:length(s)/fs - 1/fs;
subplot(521); plot(t1, s); xlabel("Time (s)"); subplot(522);
spectrogram(s,(5*10^(-3)*fs),round(2*10^(-3)*fs) , 1024, fs, "yaxis")
[s, fs] = audioread('./06FTB/e.wav');
t2 = 0:1/fs:length(s)/fs - 1/fs;
subplot(523); plot(t2, s); xlabel("Time (s)"); subplot(524);
spectrogram(s,(5*10^(-3)*fs),round(2*10^(-3)*fs) , 1024, fs, "yaxis")
[s, fs] = audioread('./06FTB/i.wav');
t3 = 0:1/fs:length(s)/fs - 1/fs;
subplot(525); plot(t3, s); xlabel("Time (s)"); subplot(526);
spectrogram(s,(5*10^(-3)*fs),round(2*10^(-3)*fs) , 1024, fs, "yaxis")
[s, fs] = audioread('./06FTB/o.wav');
t4 = 0:1/fs:length(s)/fs - 1/fs;
subplot(527); plot(t4, s); xlabel("Time (s)"); subplot(528);
spectrogram(s,(5*10^(-3)*fs),round(2*10^(-3)*fs) , 1024, fs, "yaxis")
[s, fs] = audioread('./06FTB/u.wav');
t5 = 0:1/fs:length(s)/fs - 1/fs;
subplot(529); plot(t5, s); xlabel("Time (s)"); subplot(5,2,10);
spectrogram(s,(5*10^(-3)*fs),round(2*10^(-3)*fs) , 1024, fs, "yaxis")
figure; 
[s, fs] = audioread('./09MPD/a.wav');
t1 = 0:1/fs:length(s)/fs - 1/fs;
subplot(521); plot(t1, s); xlabel("Time (s)"); subplot(522);
spectrogram(s,(5*10^(-3)*fs),round(2*10^(-3)*fs) , 1024, fs, "yaxis")
[s, fs] = audioread('./09MPD/e.wav');
t2 = 0:1/fs:length(s)/fs - 1/fs;
subplot(523); plot(t2, s); xlabel("Time (s)"); subplot(524);
spectrogram(s,(5*10^(-3)*fs),round(2*10^(-3)*fs) , 1024, fs, "yaxis")
[s, fs] = audioread('./09MPD/i.wav');
t3 = 0:1/fs:length(s)/fs - 1/fs;
subplot(525); plot(t3, s); xlabel("Time (s)"); subplot(526);
spectrogram(s,(5*10^(-3)*fs),round(2*10^(-3)*fs) , 1024, fs, "yaxis")
[s, fs] = audioread('./09MPD/o.wav');
t4 = 0:1/fs:length(s)/fs - 1/fs;
subplot(527); plot(t4, s); xlabel("Time (s)"); subplot(528);
spectrogram(s,(5*10^(-3)*fs),round(2*10^(-3)*fs) , 1024, fs, "yaxis")
[s, fs] = audioread('./09MPD/u.wav');
t5 = 0:1/fs:length(s)/fs - 1/fs;
subplot(529); plot(t5, s); xlabel("Time (s)"); subplot(5,2,10);
spectrogram(s,(5*10^(-3)*fs),round(2*10^(-3)*fs) , 1024, fs, "yaxis")
figure; 
[s, fs] = audioread('./12FTD/a.wav');
t1 = 0:1/fs:length(s)/fs - 1/fs;
subplot(521); plot(t1, s); xlabel("Time (s)"); subplot(522);
spectrogram(s,(5*10^(-3)*fs),round(2*10^(-3)*fs) , 1024, fs, "yaxis")
[s, fs] = audioread('./12FTD/e.wav');
t2 = 0:1/fs:length(s)/fs - 1/fs;
subplot(523); plot(t2, s); xlabel("Time (s)"); subplot(524);
spectrogram(s,(5*10^(-3)*fs),round(2*10^(-3)*fs) , 1024, fs, "yaxis")
[s, fs] = audioread('./12FTD/i.wav');
t3 = 0:1/fs:length(s)/fs - 1/fs;
subplot(525); plot(t3, s); xlabel("Time (s)"); subplot(526);
spectrogram(s,(5*10^(-3)*fs),round(2*10^(-3)*fs) , 1024, fs, "yaxis")
[s, fs] = audioread('./12FTD/o.wav');
t4 = 0:1/fs:length(s)/fs - 1/fs;
subplot(527); plot(t4, s); xlabel("Time (s)"); subplot(528);
spectrogram(s,(5*10^(-3)*fs),round(2*10^(-3)*fs) , 1024, fs, "yaxis")
[s, fs] = audioread('./12FTD/u.wav');
t5 = 0:1/fs:length(s)/fs - 1/fs;
subplot(529); plot(t5, s); xlabel("Time (s)"); subplot(5,2,10);
spectrogram(s,(5*10^(-3)*fs),round(2*10^(-3)*fs) , 1024, fs, "yaxis")
figure; 
[s, fs] = audioread('./16FTH/a.wav');
t1 = 0:1/fs:length(s)/fs - 1/fs;
subplot(521); plot(t1, s); xlabel("Time (s)"); subplot(522);
spectrogram(s,(5*10^(-3)*fs),round(2*10^(-3)*fs) , 1024, fs, "yaxis")
[s, fs] = audioread('./16FTH/e.wav');
t2 = 0:1/fs:length(s)/fs - 1/fs;
subplot(523); plot(t2, s); xlabel("Time (s)"); subplot(524);
spectrogram(s,(5*10^(-3)*fs),round(2*10^(-3)*fs) , 1024, fs, "yaxis")
[s, fs] = audioread('./16FTH/i.wav');
t3 = 0:1/fs:length(s)/fs - 1/fs;
subplot(525); plot(t3, s); xlabel("Time (s)"); subplot(526);
spectrogram(s,(5*10^(-3)*fs),round(2*10^(-3)*fs) , 1024, fs, "yaxis")
[s, fs] = audioread('./16FTH/o.wav');
t4 = 0:1/fs:length(s)/fs - 1/fs;
subplot(527); plot(t4, s); xlabel("Time (s)"); subplot(528);
spectrogram(s,(5*10^(-3)*fs),round(2*10^(-3)*fs) , 1024, fs, "yaxis")
[s, fs] = audioread('./16FTH/u.wav');
t5 = 0:1/fs:length(s)/fs - 1/fs;
subplot(529); plot(t5, s); xlabel("Time (s)"); subplot(5,2,10);
spectrogram(s,(5*10^(-3)*fs),round(2*10^(-3)*fs) , 1024, fs, "yaxis")
figure; 
[s, fs] = audioread('./19MXK/a.wav');
t1 = 0:1/fs:length(s)/fs - 1/fs;
subplot(521); plot(t1, s); xlabel("Time (s)"); subplot(522);
spectrogram(s,(5*10^(-3)*fs),round(2*10^(-3)*fs) , 1024, fs, "yaxis")
[s, fs] = audioread('./19MXK/e.wav');
t2 = 0:1/fs:length(s)/fs - 1/fs;
subplot(523); plot(t2, s); xlabel("Time (s)"); subplot(524);
spectrogram(s,(5*10^(-3)*fs),round(2*10^(-3)*fs) , 1024, fs, "yaxis")
[s, fs] = audioread('./19MXK/i.wav');
t3 = 0:1/fs:length(s)/fs - 1/fs;
subplot(525); plot(t3, s); xlabel("Time (s)"); subplot(526);
spectrogram(s,(5*10^(-3)*fs),round(2*10^(-3)*fs) , 1024, fs, "yaxis")
[s, fs] = audioread('./19MXK/o.wav');
t4 = 0:1/fs:length(s)/fs - 1/fs;
subplot(527); plot(t4, s); xlabel("Time (s)"); subplot(528);
spectrogram(s,(5*10^(-3)*fs),round(2*10^(-3)*fs) , 1024, fs, "yaxis")
[s, fs] = audioread('./19MXK/u.wav');
t5 = 0:1/fs:length(s)/fs - 1/fs;
subplot(529); plot(t5, s); xlabel("Time (s)"); subplot(5,2,10);
spectrogram(s,(5*10^(-3)*fs),round(2*10^(-3)*fs) , 1024, fs, "yaxis")
figure; 
[s, fs] = audioread('./21MTL/a.wav');
t1 = 0:1/fs:length(s)/fs - 1/fs;
subplot(521); plot(t1, s); xlabel("Time (s)"); subplot(522);
spectrogram(s,(5*10^(-3)*fs),round(2*10^(-3)*fs) , 1024, fs, "yaxis")
[s, fs] = audioread('./21MTL/e.wav');
t2 = 0:1/fs:length(s)/fs - 1/fs;
subplot(523); plot(t2, s); xlabel("Time (s)"); subplot(524);
spectrogram(s,(5*10^(-3)*fs),round(2*10^(-3)*fs) , 1024, fs, "yaxis")
[s, fs] = audioread('./21MTL/i.wav');
t3 = 0:1/fs:length(s)/fs - 1/fs;
subplot(525); plot(t3, s); xlabel("Time (s)"); subplot(526);
spectrogram(s,(5*10^(-3)*fs),round(2*10^(-3)*fs) , 1024, fs, "yaxis")
[s, fs] = audioread('./21MTL/o.wav');
t4 = 0:1/fs:length(s)/fs - 1/fs;
subplot(527); plot(t4, s); xlabel("Time (s)"); subplot(528);
spectrogram(s,(5*10^(-3)*fs),round(2*10^(-3)*fs) , 1024, fs, "yaxis")
[s, fs] = audioread('./21MTL/u.wav');
t5 = 0:1/fs:length(s)/fs - 1/fs;
subplot(529); plot(t5, s); xlabel("Time (s)"); subplot(5,2,10);
spectrogram(s,(5*10^(-3)*fs),round(2*10^(-3)*fs) , 1024, fs, "yaxis")
figure; 
[s, fs] = audioread('./22MHL/a.wav');
t1 = 0:1/fs:length(s)/fs - 1/fs;
subplot(521); plot(t1, s); xlabel("Time (s)"); subplot(522);
spectrogram(s,(5*10^(-3)*fs),round(2*10^(-3)*fs) , 1024, fs, "yaxis")
[s, fs] = audioread('./22MHL/e.wav');
t2 = 0:1/fs:length(s)/fs - 1/fs;
subplot(523); plot(t2, s); xlabel("Time (s)"); subplot(524);
spectrogram(s,(5*10^(-3)*fs),round(2*10^(-3)*fs) , 1024, fs, "yaxis")
[s, fs] = audioread('./22MHL/i.wav');
t3 = 0:1/fs:length(s)/fs - 1/fs;
subplot(525); plot(t3, s); xlabel("Time (s)"); subplot(526);
spectrogram(s,(5*10^(-3)*fs),round(2*10^(-3)*fs) , 1024, fs, "yaxis")
[s, fs] = audioread('./22MHL/o.wav');
t4 = 0:1/fs:length(s)/fs - 1/fs;
subplot(527); plot(t4, s); xlabel("Time (s)"); subplot(528);
spectrogram(s,(5*10^(-3)*fs),round(2*10^(-3)*fs) , 1024, fs, "yaxis")
[s, fs] = audioread('./22MHL/u.wav');
t5 = 0:1/fs:length(s)/fs - 1/fs;
subplot(529); plot(t5, s); xlabel("Time (s)"); subplot(5,2,10);
spectrogram(s,(5*10^(-3)*fs),round(2*10^(-3)*fs) , 1024, fs, "yaxis")



