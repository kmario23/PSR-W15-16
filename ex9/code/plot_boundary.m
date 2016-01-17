function [] = plot_boundary(data,wml)

    labels = data(:,3);
    scatter(data(:,1),data(:,2),50,labels);

    x1plot = linspace(-20, 20, 400)';
    x2plot = linspace(-20, 20, 400)';
    [X1, X2] = meshgrid(x1plot, x2plot);
    vals = zeros(size(X1));

    for i = 1:size(X1, 2)
       this_X = [X1(:, i), X2(:, i)];
       vals(:, i) = predict(wml, this_X);
    end

    % Plot the boundary
    hold on
    contour(X1, X2, vals,'Color', 'g');
    hold off;

end
