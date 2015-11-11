function [w] = hammingWindow(t,T)

alpha = 0.54;

w = alpha-(1-alpha)*cos(2*pi*t/(T-1));
w = w.*(t<T&t>=0);

end