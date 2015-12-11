function [means,covs,weights] = gmm_init(data,clusters,indices)

%find means
means = clusters;

%find weights
for i=1:size(clusters,1)
weights(i) = sum(indices==i)/size(data,1);
end

%find covariances
m = horzcat(data,indices');
m = sortrows(m,size(data,2)+1);
m_ = m;
m_(:,size(data,2)+1) = [];

covs = cell(size(clusters,1),1);
for i=1:size(clusters,1)
s = (m(:,size(data,2)+1) == i);
ones_indices = find(s);
covs{i} = cov(m_(ones_indices(1):ones_indices(length(ones_indices)),:));
end

end