function [centers,indices] = kmeans_(data,init)

N = size(data,1);
clusters = init;
k = size(init,1);
indices_old = zeros(N,1);
indices_old = indices_old';
maxIter = 25;

for iter=1:maxIter

%assignment step
for i=1:N
indices(i) = associate(clusters,data(i,:));
end

%update step
clusters = compute_means(data,indices',k);

%stopping criteria (if there is no change in assignments than break)
if sum(indices-indices_old)==0
break;
end

indices_old = indices;
fprintf('iteration: %4d\n', iter);

iter = iter + 1;
end

centers = clusters;

end