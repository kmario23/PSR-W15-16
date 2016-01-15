function [data, perm_data, prediction, wml] = main()

   %load data
   filename = 'dataset-train.csv';
   data = csvread(filename);
   %data = [0,0,0;1,0,1;0,1,1;1,1,0];
   
   %data(:,3) = (2*data(:,3)/(max(data(:,3))))-1;
   
   %shuffling
   idx = randperm(size(data,1));
   perm_data = data(idx, :);

   
   %w1 = rand(2,3);
  % w2 = rand(3,1);
   %wml{1} = w1;
  %wml{2} = w2;
   %train the network (i.e. get the optimal weight matrix)
   learning_rate = 0.1;
   hidden_neurons = 6;
   [wml,errors] = trainNetwork(perm_data,hidden_neurons,learning_rate);
   prediction = predict(wml,data);
   plot(errors);
   xlabel('Number of epochs') % x-axis label
   ylabel('Error') % y-axis label
	   
   %predict(data);
end