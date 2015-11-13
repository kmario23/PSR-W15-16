function [f_] = applyHamming(f,winsize,shift,flengthms)

T = (winsize/flengthms)*length(f);
x = [1:T];
w = hammingWindow(x,T);
shift_ = (shift/flengthms)*length(f);

f_ = f(shift_:shift_ + T-1).*w';
end