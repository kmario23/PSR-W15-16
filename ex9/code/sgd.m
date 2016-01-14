function sgd = sigmoid(ele,derivative)
	if derivative == 0
	%return sigmoid function
    sgd = 1/(1+exp(-ele));
	
	else
	%return derivative of the sigmoid function
	sgd = 1/(1+exp(-ele)) * (1 - (1/(1+exp(-ele))));
	
	end
end