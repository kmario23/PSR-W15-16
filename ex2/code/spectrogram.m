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

figure(1), plot(t,f);
title('complete waveform'), xlabel('time(s) ---> '), ylabel('amplitude');
clc;

%spectrogram with default values, N samples%
n = 0:1024-1;
w0 = 2*pi/5;
x = sin(w0*n)+10*sin(2*w0*n);
s = spectrogram(x);
spectrogram(x,'yaxis')
