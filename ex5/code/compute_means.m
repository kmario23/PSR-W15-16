function means = compute_means(data_set,indices,k)

N = size(data_set,2);

m = horzcat(data_set,indices);
m = sortrows(m,N+1);
m_ = m;
m_(:,N+1) = [];

for i=1:k
s = (m(:,N+1) == i);
ones_indices = find(s);
means(i,:) = mean(m_(ones_indices(1):ones_indices(length(ones_indices)),:));
end


end