function prediction = predict(wml, data)
    [r, c] = size(data);
    prediction = zeros(r,1);
	
	w1 = wml{1};
	w2 = wml{2};
   
   
   for i = 1:size(data,1)
      x1x2 = data(i,1:2);
      x1x2 = x1x2';
	  
      %a1 = dot(x1x2, w1);
	  a1 = w1'*x1x2;
      sgmd1 = (sgd(a1,0));
	  
      
      a2 = w2'*sgmd1;
      sgmd2 = sgd(a2,0);
      
      if sgmd2 > 0.5
	  prediction(i,1) = 1;
	  else
	  prediction(i,1) = 0;
	  end
   end
   
end


