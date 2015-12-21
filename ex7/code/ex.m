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
  % node2 - 0.019
  % node3 - 0.07
  % node4 - 0.02
  % node5 - 0.34
  % node6 - 0.25
  % node7 - 0.375
  
  %ex 1.5 entropy of each node
  % node1 - 0.96
  % node2 - 0.137
  % node3 - 0.398
  % node4 - 0.145
  % node5 - 0.92
  % node6 - 0.811
  % node7 - 0.95
  
  %ex 1.6 information gain of non-leaf nodes
  % node1 = 0.96 - (258/435 * 0.137 + 167/435 * 0.398) = 0.72
  % node2 = 0.398 - (145/177 * 0.145 + 32/177 * 0.92) = 0.11
  % node3 = 0.92 - (24/32 * 0.811 + 8/32 * 0.95) = 0.07
  
  %ex 1.7
  % The information gain is a good measure because maximizing the information gain 
  % for a given node is equivalent to minimizing the entropy of its children. Minimizing the entropy of the children
  % will result in more purity, therefore less clasification error. The question about anti-satellite-test-ban will maximize the information gain. This question will result into pure splits.
  
  %ex 1.8
  % Start with the root node. For all the possible questions to ask choose the one which results into the highest possible information gain. Repeat this for all the nodes.
  % If a splitting of a node results into a pure split, stop splitting on that node.
  
  %ex 2.1
  %The prior probabilities of the two classes are:
  % republican - 0.38
  % democrat - 0.62
  
  %ex 2.2
   % P(x ["education-spending"] = no | republican) = 0.11
   % P(x ["education-spending"] = no | democrat) = 0.79
   
  %ex 2.3
  %The democrat class has the highest probability given that x[”education-spending”] = no
  
  
   
   
  
  
  
  
 
  
  
  
  