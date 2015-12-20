%ex 1.1 load data
samples = tdfread('voting.tab');
labels = samples.party;
samples = rmfield(samples,'party');
names = fieldnames(samples);
 
 
 if (0)
 %ex 1.2 test decision tree with 1 sample
   sample_num = 1;
   D = [];
   for i=1:size(names,1)
   D = [D, samples.(names{i})(sample_num)];
   end
  [path_,hist_] = decision_tree(D,sample_num,labels);
 end
 
  if (1)
 %ex 1.3
  hists = zeros(7,2);
  for j=1:435
  D = [];
	  for i=1:size(names,1)
	  D = [D, samples.(names{i})(j)];
	  end
  [path_,hist_] = decision_tree(D,j,labels);
  hists = hists + hist_;
  end
  end
  
  %ex 1.4 misclassification rates
  % node1 - 0.38
  % node2 - 0.04
  % node3 - 0.25
  % node4 - 0.41
  % node5 - 0.12
  % node6 - 0
  % node7 - 0.05
  
  %ex 1.5 entropy of each node
  % node1 - 0.96
  % node2 - 0.28
  % node3 - 0.82
  % node4 - 0.97
  % node5 - 0.53
  % node6 - 0
  % node7 - 0.28
  
  %ex 1.6 information gain of non-leaf nodes
  % node1 = 0.96 - (223/435 * 0.28 + 212/435 * 0.82) = 0.41
  % node2 = 0.82 - (63/212 * 0.97 + 149/212 * 0.53) = 0.15
  % node3 = 0.53 - (11/149 * 0 + 138/149 * 0.28) = 0.27
  
  %ex 1.7
  % The information gain is a good measure because maximizing the information gain 
  % for a given node is equivalent to minimizing the entropy of its children. Minimizing the entropy of the children
  % will result in more purity, therefore less clasification error. The question about crime will maximize the information gain.
  
  %ex 1.8
  % Start with the root node. For all the possible questions to ask choose the one which results into the highest possible information gain. Repeat this for all the nodes.
  % If a splitting of a node results into a pure split, stop splitting on that node.
  
 
  
  
  
  