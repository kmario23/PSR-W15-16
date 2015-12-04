function val = kmeans_init(data,k)

a=1;
b=size(data,1);

%get k random points from the dataset (to be used as the initial clusters)
for i=1:k
val(i,:) = data(randi([1 size(data,1)],1),:);
end

end