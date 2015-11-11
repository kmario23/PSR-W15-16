function [w] = rectangularWindow(t,T)

w = ones(1,numel(t)).*(t<T&t>=0);
%w = (t<T&t>=0);

end