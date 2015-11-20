load('dataset.mat')

%EX. 1

%first find the line which best separates the data
min_a = -3;
min_b = -3;
max_a = 3;
max_b = 3;
step_a = 0.7;
step_b = 0.7;

accuracy_ = 0;
best_a = 0;
best_b = 0;

for a = min_a:step_a:max_a
for b = min_b:step_b:max_b
	y_predict = ds_.x1*a + b;
	labeled_as_virginica = 2*(y_predict < ds_.x3); %label versicolor as 2
	labeled_as_setosa = y_predict > ds_.x3; %label setosa as 1
	accuracy = (sum(labeled_as_virginica == ds_.type) + sum(labeled_as_setosa == ds_.type))/size(ds_,1);
	%fprintf('a=%6.2f, b=%6.2f, Accuracy: %6.2f \n',a,b,accuracy);
	if accuracy>accuracy_
	accuracy_ = accuracy;
	best_a = a;
	best_b = b;
	end
end
end

% plot data and decision boundary (error should be 0)
x = 3:1:7;
plot(x, x*best_a + best_b);
hold on
labels = ds_.type;
scatter(ds_.x1,ds_.x3,50,labels)
xlabel('Sepal length'); 
ylabel('Petal length');
hold off
saveas(gcf,'Ex1','eps');

%EX. 2 

%dimensions of W are nx1

%EX. 3

%get our X matrix first
X = ds_(:,1);
X(:,2) = ds_(:,2);
X = double(X);

W_min = -1;
W_max = 1;
W_step = 0.01;
error_ = 9999999;
opt_a =0;
opt_b =0;

for i =W_min:W_step:W_max
for j= W_min:W_step:W_max
W = [i;j];
T = X*W;
error = norm(X-T*W',2)^2;
if error < error_
	error_ = error;
	opt_a = i;
	opt_b = j;
end
end
end

%EX. 4
opt_a = abs(opt_a);
opt_b = abs(opt_b);
x = [0:7];
y = x*(opt_b/opt_a);

plot(x,y);
hold on
scatter(ds_.x1,ds_.x3,50,labels)
xlabel('Sepal length'); 
ylabel('Petal length');
hold off
saveas(gcf,'Ex4','eps');

%EX. 5

W = [opt_a;opt_b];
T = X*W;
X1 = X(1:50,:);
X2 = X(51:100,:);
T1 = X1*W;
T2 = X2*W;
plot(T1,0,'b.','MarkerSize',10); 
hold on
plot(T2,0,'r.','MarkerSize',10); 
%plot a line which separates the data with 0 error
x=[4:9];
plot(x,x*(0.2/0.3)-4.06); 
hold off
saveas(gcf,'Ex5','eps');




