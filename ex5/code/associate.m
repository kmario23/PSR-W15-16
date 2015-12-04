%clusters are the means of the clusters
function cluster_index = associate(clusters,v)

n = size(clusters,1);

for i=1:n
%store distances from v to each cluster
distances(i,1) = rmse(clusters(i,:),v);
%store the index for each
distances(i,2) = i;
end


distances = sortrows(distances,1);
cluster_index = distances(1,2);

end