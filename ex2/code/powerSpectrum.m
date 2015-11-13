function [s_] = powerSpectrum(s)

s_ = 10*log10((s.*conj(s)).^2);

end