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
resRect = rectWindow(x,100);
resHamm = hammingWindow(x,100);
figure(7), plot(resRect);
figure(8), plot(resHamm);

%apply and plot fourier transform of the signal at 0.55s
N=1024;
X=fft(applyHamming(f,25,110,slengthms),N);
nVals=(-N/2:N/2-1); %fft sample points
figure(9), plot(nVals,abs(X));
title('Fourier spectrum of the signal from 0.55s to 0.575s'), xlabel('Sample Points'), ylabel('FFT values');
clc;

%apply fftshift
N=1024;
X=fftshift(X);
nVals=Fs*((-N/2:N/2-1)/N); %x axis will now represent frequency	 
figure(10), plot(nVals,abs(X));
title('Fourier spectrum of the signal from 0.55s to 0.575s'), xlabel('Frequency'), ylabel('FFT values');
clc;

%plot power spectrum
figure(11),plot(nVals,powerSpectrum(X));
title('Power spectrum of the signal from 0.55s to 0.575s'), xlabel('Frequency'), ylabel('Power');
clc;

