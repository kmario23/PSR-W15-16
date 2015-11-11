function [w] = hammingWindow(t,T)

alpha = 0.54;
const = alpha-(1-alpha);

w = const*cos(2*pi*t/(T-1));
w = w.*(t<T&t>=0);

end