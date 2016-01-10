function question = find_question(questions,data)

%if the data is empty(pure) then mark the question as 0 (leaf)
if isempty(data)

question = 0;

else

for i=1:size(questions,1)
	temp = 0;
	if isempty(questions{i})
	continue;
	end
	for j=1:size(questions{i,1},2)
	c = strcmp(questions{i,1}(j),data(:,1));
	temp = temp + sum(c);
	end
	p1 = temp/size(data,1);
	p2 = 1 - p1;
	entropy_impurity(i) = -(p1*log2(p1) + p2*log2(p2));
	
	
end
%question is the index of the question with lowest entropy impurity
[m,question] = min(entropy_impurity);

end
end