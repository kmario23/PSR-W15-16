load('dataset1.mat')

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

opt_a = abs(opt_a);
opt_b = abs(opt_b);
x = [0:7];
y = x*(opt_b/opt_a);
labels = ds_.type;
plot(x,y);
hold on
scatter(ds_.x1,ds_.x2,50,labels)
xlabel('Sepal length'); 
ylabel('Sepal width');
hold off
saveas(gcf,'Ex6_2','eps');


W = [opt_a;opt_b];
T = X*W;
X1 = X(1:50,:);
X2 = X(51:100,:);
T1 = X1*W;
T2 = X2*W;
plot(T1,0,'b.','MarkerSize',10); 
hold on
plot(T2,0,'r.','MarkerSize',10); 
hold off
saveas(gcf,'Ex6_3','eps');




