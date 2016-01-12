function [data, perm_data, prediction] = main()

   %load data
   filename = 'dataset-train.csv';
   data = csvread(filename);
   
   %shuffling
   idx = randperm(size(data,1));
   perm_data = data(idx, :);
   
   %train the network (i.e. get the optimal weight matrix)
   prediction = trainNetwork(perm_data);
   
   %predict(data);
end