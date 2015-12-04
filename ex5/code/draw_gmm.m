function [] = draw_gmm(means,covs,k)
x= -15:0.001:15;
	hold on
	for i=1:k
	a = normpdf(x,means(i),covs{i});
	plot(x,10000*a,'r-', 'LineWidth',2);
	hold on;
	end
	hold off
end