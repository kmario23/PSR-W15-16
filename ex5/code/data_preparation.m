fileID = fopen('corpus');
A = fread(fileID,[677970 50], 'float32');
%remove useless dimension
A(:,1) = [];

%apply PCA
[COEFF,SCORE] = pca(A);
%display distribution
transformed_data = SCORE(:,1);
hist(transformed_data,200);