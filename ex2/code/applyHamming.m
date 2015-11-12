function [f_] = applyHamming(f,winsize,shift,flengthms)

T = (winsize/flengthms)*length(f);
x = [1:T];
w = hammingWindow(x,T);
shift_ = (shift/flengthms)*length(f);

i = 1;
f_(i:i+T-1) = f(i:i+T-1).*w';
while i<=length(f)-T
i = i + shift_;
f_(i:i+T-1) = f(i:i+T-1).*w';
end
f_ = f_';
end