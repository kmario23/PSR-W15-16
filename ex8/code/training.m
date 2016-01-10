function tree = training(train_data,validation_data,questions,means)


epsilon = 1;

tree = train_tree(train_data,0,1,questions);

%train trees with different depth and check for the stopping criteria each iteration
for i=2:20

prev_tree = tree;
tree = train_tree(train_data,0,i,questions);

fprintf(' tree depth: %4d, RMSE = %10f \n', i, eval_tree(tree,validation_data,questions,means) - eval_tree(prev_tree,validation_data,questions,means));

if eval_tree(tree,validation_data,questions,means) - eval_tree(prev_tree,validation_data,questions,means) > epsilon
break;
end

end

end