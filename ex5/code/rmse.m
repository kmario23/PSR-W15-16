function distance = rmse(v1, v2)

distance = sqrt(1/length(v1) * sum((v1-v2).^2));

end
