function m = eval_tree(tree,corpus,questions,means_of_clusters)

m = 0;

for i=1:size(corpus,1)

sample = corpus(i,1);
m = m + sqrt((classify_by_tree(tree,sample,questions,means_of_clusters) - corpus(i,2)) ^2);

end

end