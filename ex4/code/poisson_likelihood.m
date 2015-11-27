function m = mle_estimation(k,lambda)

for j=1:length(lambda)
m(j) = 1;
for i=1:length(k)
m(j) = m(j)* lambda(j)^k(i)*exp(-lambda(j))/(factorial(k(i)));
end
end

end

