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


%spectrogram with default values, N samples%
n = 0:1024-1;
w0 = 2*pi/5;
x = sin(w0*n)+10*sin(2*w0*n);
s = spectrogram(x);
spectrogram(x,'yaxis')
