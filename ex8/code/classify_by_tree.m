function result = classify_by_tree(tree,sample,questions,means_of_clusters)

%if it's a leaf node return the mean of the leaf
if (isstruct(tree.left) == 0) 
result = means_of_clusters(tree.value);
return
end

%if it's a leaf node return the mean of the leaf
if isstruct(tree.right) == 0
result = means_of_clusters(tree.value);
return
end

path = classify(tree,sample,questions);

if path == 1
classify_by_tree(tree.left,sample,questions,means_of_clusters);

else
classify_by_tree(tree.right,sample,questions,means_of_clusters);

end



end