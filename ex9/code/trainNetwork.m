function wml = trainNetwork(data)

hidden_neurons = 1;

w1 =  rand(2,hidden_neurons);
w2 =  rand(hidden_neurons,1);

epochs = 800;
learning_rate = 0.15;

%stochastic gradient descent
for epoch = 1:epochs
	for i = 1:size(data,1)
	
	 x1x2 = data(i,1:2);
     x1x2 = x1x2';
	  
	 a1 = w1'*x1x2;
     sgmd1 = (sgd(a1,0))';
	  
     a2 = w2'*sgmd1;
     output = sgd(a2,0);
	
	
	w2_deriv =  (output - data(i,3))* sgd(a2,1) * sgmd1;
	%w2_deriv_all = [w2_deriv_all w2_deriv];
	%w2_deriv =  (output - data(i,3))* output * (1-output) * sgmd1;
	%w1_deriv =  (output - data(i,3))* sgd(a2,1) * w2 * sgd(a1,1) * x1x2;
	
	for m=1:2
		for j=1:hidden_neurons
		w1_deriv(m,j) = (output - data(i,3))* sgd(a2,1) * w2(j) * sgd(a1(j),1) * x1x2(m);
		%w1_deriv(m,j) = (output - data(i,3))* output * (1-output) * w2(j) * a1(j) * (1-a1(j)) * x1x2(m);
		end
	end
	
	w2 = w2 - (learning_rate*w2_deriv);
	w1 = w1 - (learning_rate*w1_deriv);
	
	end
		wml{1} = w1;
		wml{2} = w2;
		prediction = predict(wml,data);
		error = 1/2*sum((prediction - data(:,3)).^2);
		fprintf(' Epoch: %4d, Error = %10f\n', epoch,error);
		
		idx = randperm(size(data,1));
		data = data(idx, :);
end





end

