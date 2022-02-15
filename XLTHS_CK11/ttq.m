[y,Fs] = audioread('\30FTN.wav'); % Fetch the signal.

F0 = FFT1231(y,Fs,2^11);

plot(F0,'*');
xlabel('Frequency(Hz)');
ylabel('Signal Spectral');
title('Calculated F0 - FFT - FFT points = 2^11');
m=[];
for i= 1:length(F0)
    if(F0(i)> 0)
    m=[m F0(i)];
   
    end
end
mean(m)
std(m)
 function [f0] = FFT1231(signal,fs,N)
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
        P1 = P2(1:length(P2)/2+1); % The single-sided spectrum P1
        P1(2:end-1) = 2*P1(2:end-1); % Conserving energy of P1 spectrum. 
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
            if (local_maxima(i) > 2) % If the maxima's amplitude is greater than threshold = 2 
                pos = [pos i]; % Then store its position index to pos vector.
            end
        end
        
        frame_max = max(frame); % Global maximum of frame.
        if (frame_max > 0.03) % Remove the noise by limiting the amplitude of signal in frame.
            if (length(pos) >= 2) % At least 2 local maxima in pos vector.
                lag1 = freq(pos(1)); % Frequency 1 of local maxima 1st.
                lag2 = freq(pos(2))-freq(pos(1)); % Frequency 2 of local maxima 2nd.
                if (lag1 > 75) && (lag1 < 350) % If frequency 1 is in the range
                    if (lag2 > 75) && (lag2 < 350) % If frequency 2 is in the range
                        f0(k) = (lag1 + lag2)/2; % Calculate the average frequency.
                    else 
                        f0(k) = lag1; % Or else return to frequency 1.
                    end 
                else
                f0(k) = -inf; % Else current frame is noise, F0 is can't be determined.
                end
            else
            f0(k) = -inf; % Else current frame is noise, F0 is can't be determined.
            end
        else
            f0(k) = -inf; % Else current frame is noise, F0 is can't be determined.
        end
    end
 end
