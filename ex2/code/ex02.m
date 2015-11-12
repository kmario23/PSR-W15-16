%sampling frequency (or sample rate) is the number of samples per second%

%samples, sampling rate%
[f,Fs] = audioread('cmu.wav');


%number of samples%
N = length(f);

%length of sound file in seconds%
slength = N/Fs;

%length of sound file in milliseconds%
slengthms = slength*1000;

%linearly spaced vector of size N %
t=linspace(0, slength, N);

%plot whole waveform
figure(1), plot(t,f);
title('complete waveform'), xlabel('time(s) ---> '), ylabel('amplitude');
clc;

%plot from 0.55s to 0.6s
f_55s_new = f((0.55/slength)*N:(0.6/slength)*N);
t_55s_new = t((0.55/slength)*N:(0.6/slength)*N);
figure(2), plot(t_55s_new,f_55s_new);
title('waveform from 0.55s to 0.6s'), xlabel('time(s) ---> '), ylabel('amplitude');
clc;

%plot from 2s to 2.1s
f_2s_new = f((2/slength)*N:(2.1/slength)*N);
t_2s_new = t((2/slength)*N:(2.1/slength)*N);
figure(3), plot(t_2s_new,f_2s_new);
title('waveform from 2s to 2.1s'), xlabel('time(s) ---> '), ylabel('amplitude');
clc;

%plot whole spectrogram 
s = spectrogram(f);
figure(4);
spectrogram(f,'yaxis');
title('complete spectrogram');

%spectrogram of the 0.55s to 0.6 interval
figure(5);
spectrogram(f_55s_new,'yaxis');
title('spectrogram  0.55s and ending at 0.6s');

%spectrogram of the 2s to 2.1s interval
figure(6);
spectrogram(f_2s_new,'yaxis');
title('spectrogram  2s to 2.1s');

%plot rect and hamming windows in the interval [-10,110]
x = [-10:110];
result = rectWindow(x,100);
result2 = hammingWindow(x,100);
figure(7);
plot(result);
figure(8);
plot(result2);

%apply hamming window to the signal
winsize = 25;
frameshift = 5;
f_new = applyHamming(f,winsize,frameshift,slengthms);
figure(8), plot(t,f_new);
title('complete waveform'), xlabel('time(s) ---> '), ylabel('amplitude');
clc;



