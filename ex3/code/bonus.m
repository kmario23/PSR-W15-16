load('dataset2.mat')

W = [0.323657,-0.168100,0.869291,0.333649;0.656822,0.748155,-0.091511,-0.021791;0.673198,-0.631676,-0.266429,-0.277136;-0.103125,0.113979,0.406171,-0.900777];
W = W';
%original covariance matrix
cov_original = cov(X);
X_4d = X*W;
%4d covariance matrix
cov_4d = cov(X_4d);
W_3d = W;
W_3d(:,4) = [];
X_3d = X*W_3d;
%3d covariance matrix
cov_3d = cov(X_3d);
W_2d = W_3d;
W_2d(:,3) = [];
X_2d = X*W_2d;
%2d covariance matrix
cov_2d = cov(X_2d);
W_1d = W_2d;
W_1d(:,2) = [];
X_1d = X*W_1d;
%1d covariance matrix
cov_1d = cov(X_1d);

