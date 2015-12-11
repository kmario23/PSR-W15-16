fileID = fopen('corpus');
A = fread(fileID,[50 677970], 'float32');
A = A';
%remove useless dimension
A(:,1) = [];

%keep only 100th sample
s = [1:size(A,1)];
s = s';
m = mod(s,100) == 0;
A_ = A(m,:);

%apply PCA
[COEFF,SCORE] = pca(A_);
transformed_data = horzcat(SCORE(:,1),SCORE(:,2));
%display distribution
plot(transformed_data(:,1),transformed_data(:,2),'.');