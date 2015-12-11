function [] = plot_kmeans(data,numberOfClusters)

[IDX,C] = kmeans(data,numberOfClusters);
figure,scatter(data(:,1),data(:,2),5,IDX);


end