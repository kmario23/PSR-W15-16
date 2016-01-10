function path = classify(tree,sample,questions)

question = questions{tree.value,1};

if sum(strcmp(sample,question)) > 0
%question about the sample is yes
path = 1;

else
%question about the sample is no
path = 0;

end

end