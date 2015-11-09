
%read dataset%
ds = dataset('File','iris.dat', 'Delimiter', ',');

%get total # labels%
sum_all_labels = size(ds.type,1);

%get count of iris-setosa%
sum_iris_setosa = sum(strcmp(ds.type,'Iris-setosa'));

sum_iris_versicolor = sum(strcmp(ds.type,'Iris-versicolor'));

sum_iris_virginica = sum(strcmp(ds.type,'Iris-virginica'));

p_iris_setosa = sum_iris_setosa/sum_all_labels;
p_iris_versicolor = sum_iris_versicolor/sum_all_labels;

swidth_gt_4 = sum(ds.sepal_width > 4);
p_swidth_gt_4 = swidth_gt_4 / (size(ds.sepal_width,1));

slength_lt_6 = sum(ds.sepal_length < 6);
p_slength_lt_6 = slength_lt_6 / (size(ds.sepal_length,1));

%not iris-setosa%
iris_versicolor = strcmp(ds.type, 'Iris-versicolor') ;
iris_virginica = strcmp(ds.type, 'Iris-virginica') ;
%scatter(iris_versicolor, iris_virginica);%

A = [1 2 3; 3 4 5; 5 6 7];

%idx_versi = find(ds.sepal_width > 4)%
clear;
tb = readtable('iris.dat', 'Delimiter', ',');
figure();
histogram(tb.sepal_width);
title('sepal width');

for i = 1:10
    disp(['the number is ', int2str(i)]);
end