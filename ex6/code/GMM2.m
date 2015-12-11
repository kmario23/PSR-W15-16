function [means, covarianceMatrices, priors] = GMM2(data,numberOfClusters)

maxIter = 1000;

[IDX,C] = kmeans(data,numberOfClusters);

%STEP 1 initial values

m = size(data,1);
n = size(data,2);

%initial parameters of the gaussians from kmeans
[mu,sigma,phi] = gmm_init(data,C,IDX');

%initial gamma
gamma_ = zeros(m, numberOfClusters);

%EM Algorithm
for (iter = 1:maxIter)

fprintf('EM Iteration %d\n', iter);
mu_ = mu;
%STEP 2 Expectation 
pdf = zeros(m, numberOfClusters);

	for (j = 1 : numberOfClusters)
        pdf_(:, j) = mvnpdf(data, mu(j, :), sigma{j});
    end
	
pdf_prior = bsxfun(@times, pdf_, phi);
gamma_= bsxfun(@rdivide, pdf_prior, sum(pdf_prior, 2));

%STEP 3 Maximization 

for (j = 1 : numberOfClusters)
%update priors
phi(j) = mean(gamma_(:, j), 1);
%update means
mu(j,:) = (gamma_(:,j)'* data) ./ sum(gamma_(:,j), 1);
%update covariance matrices
sigma_ = zeros(n, n);
mean_sub = bsxfun(@minus, data, mu(j, :));

	for (i=1:m)
	sigma_ = sigma_ + (gamma_(i, j) .* (mean_sub(i, :)' * mean_sub(i, :)));
	end
	
sigma{j} = sigma_ ./ sum(gamma_(:,j),1);
end
if (mu-mu_ < 0.0001)
	break
end
end

means = mu;
covarianceMatrices = sigma;
priors = phi;
end