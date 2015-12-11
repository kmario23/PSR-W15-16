function [] = plot_clusters(data,means,covarianceMatrices,priors,numberOfClusters)

	for (j = 1 : numberOfClusters)
        pdf_(:, j) = mvnpdf(data, means(j, :), covarianceMatrices{j});
    end
	
pdf_prior = bsxfun(@times, pdf_, priors);
[num idx] = max(pdf_prior,[],2);
figure,scatter(data(:,1),data(:,2),50,idx);

end