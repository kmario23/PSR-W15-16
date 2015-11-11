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


s = spectrogram(f);
figure(4);
spectrogram(f,'yaxis');
title('complete spectrogram');

figure(5);
spectrogram(f_55s_new,'yaxis');
title('spectrogram  0.55s and ending at 0.6s');

figure(6);
spectrogram(f_2s_new,'yaxis');
title('spectrogram  2s to 2.1s');




