function m = loglikelihood_mle(k,lambda)

for j=1:length(lambda)
m(j) = 0;
for i=1:length(k)
m(j) = m(j) + (k(i)*log(lambda(j)) - lambda(j) - log(factorial(k(i))));
end
end

end