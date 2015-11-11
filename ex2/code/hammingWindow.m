function [w] = rectangularWindow(t,T)

alpha = 0.54;
const = alpha-(1-alpha);

w = const*cos(2*pi*t/(T-1));


end