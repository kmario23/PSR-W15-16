load('dataset.mat')

%plot the distribution of the last column with 1000 bins
hist(ds.x2,1000);
title('Data distribution');
xlabel('Duration (ms)'); 
ylabel('Number of samples');

%split dataset into 3 sets
[trainInd,valInd,testInd] = dividerand(size(ds,1),0.9,0.05,0.05);

j=1;
%train set
for i=1:length(trainInd)
train_set{j,1} = ds{trainInd(i),1};
train_set{j,2} = ds{trainInd(i),2};
j = j+1;
end

j=1;
%test set
for i=1:length(testInd)

test_set{j,1} = ds{testInd(i),1};
test_set{j,2} = ds{testInd(i),2};
j = j+1;
end

j = 1;
%validation set
for i=1:length(valInd)

valid_set{j,1} = ds{valInd(i),1};
valid_set{j,2} = ds{valInd(i),2};
j = j+1;
end

%load the questions 
fid = fopen('questions.hed');
temp = textscan(fid,'%s','Delimiter','\n');

for i=1:size(temp{1,1},1)
 questions{i,1} = strsplit(temp{1,1}{i},','); 
end

%compute the mean for each category using the training data
for i=1:size(questions,1)
	temp = 0;
	for j=1:size(questions{i,1},2)
	c = strcmp(questions{i,1}(j),train_set(:,1));
	if sum(c)>0
	m = sum(cell2mat(train_set(c,2))) / sum(c);
	temp = temp + m;
	end
	end
	means(i) = temp / size(questions{i,1},2);
end


