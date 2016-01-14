function sgd = sigmoid(ele,derivative)
	%return sigmoid function
    if derivative == 0
	    sgd = 1/(1+exp(-ele));
        
    %return derivative of the sigmoid function    
    else
	    sgd = 1/(1+exp(-ele)) * (1 - (1/(1+exp(-ele))));
    end
    
end
