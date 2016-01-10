function tree = train_tree(train_data,current_depth,depth,questions)

tree = struct('value', 0, 'left', 0, 'right', 0);

if current_depth == depth
tree.value = find_question(questions,train_data);
return
end

current_depth = current_depth + 1;

tree.value = find_question(questions,train_data);

% TODO after find a question, it should be removed from the possible questions (we are not able to fix this)


c = false;
for j=1:size(questions{tree.value,1},2)
c = c + strcmp(questions{tree.value,1}(j),train_data(:,1));
end

c = logical(c);

%there was no more data for this node so it's a leaf. we can return
if sum(c) == 0
return
end

tree.left = train_tree(train_data(c),current_depth,depth,questions);

m = 1-c;
m = logical(m);

%there was no more data for this node so it's a leaf. we can return
if sum(m) == 0
return
end

tree.right = train_tree(train_data(m),current_depth,depth,questions);


end