function prediction = trainNetwork(data)
   w1 = rand(2,1);
   w2 = rand(1);
   
   [r, c] = size(data);
   prediction = zeros(r,c);
   
   %can use x1x2*w1 also?
   
   for i = 1:size(data,1)
      x1x2 = data(i,1:2);
      
      a1 = dot(x1x2, w1);
      sgmd1 = sigmoid(a1);
      
      a2 = sgmd1* w2;
      sgmd2 = sigmoid(a2);
      
      prediction(i,1) = a2;
   end
end