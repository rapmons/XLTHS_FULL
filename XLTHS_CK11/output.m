function output(s, fs, timeV)
    t = 0: 1/fs: length(s)/fs - 1/fs;
    
    figure;
    subplot(2 ,1 ,1);
    plot(t , s);
    xlabel('Time(s)');
    hold on
    
    for i = 1 : length(timeV)
        line([timeV(i); timeV(i)],[-1;1],'Color', 'b','linestyle','-','linewidth',1);
    end
    
    win = 0.005 * fs;
    nol = floor(win/2);
    nfft = 1024;
    subplot(2, 1, 2);
    spectrogram(s, win, nol, nfft, fs, 'yaxis');
    
    dt = 1/fs;
    for i = 2:2:length(timeV) - 2
        I0 = round( timeV(2)/dt);
        Iend = round(timeV(2 + 1)/dt);
        x = s(I0 : Iend);
        
        x1 = x.*hamming(length(x));
        preemph = [1 0.63];
        x1 = filter(1, preemph, x1);
        
        A = lpc(x1, 8);
        rts = roots(A);
        
        rts = rts(imag(rts) >= 0);
        angz = atan2(imag(rts), real(rts));
        
        [frqs, indices] = sort(angz * (fs/(2 * pi)));
        bw = -1/2 * (fs / (2 * pi)) * log(abs(rts(indices)));
        
        nn = 1;
        for kk = 1:length(frqs)
            if (frqs(kk) > 90 && bw(kk) <400)
                formants(nn) = frqs(kk);
                nn = nn+1;
            end
        end
        formants
    end
end