function [path_,hist_] = decisionTree(D,index,labels)

path_ = [];
%7 nodes in total
hist_ = zeros(7,2);

if labels(index) == 'r'
hist_(1,1) = 1;
else
hist_(1,2) = 1;
end

if D(5) == 'y'
	path_ = [path_, 'y'];
	if labels(index) == 'r'
	hist_(3,1) = 1;
	else
	hist_(3,2) = 1;
	end
	if D(12) == 'y'
	path_ = [path_, 'y'];
		if labels(index) == 'r'
		hist_(5,1) = 1;
		else
		hist_(5,2) = 1;
		end
		if D(4) == 'y'
		path_ = [path_, 'y'];
			if labels(index) == 'r'
			hist_(7,1) = 1;
			else
			hist_(7,2) = 1;
			end
		else 
		path_ = [path_, 'n'];
			if labels(index) == 'r'
			hist_(6,1) = 1;
			else
			hist_(6,2) = 1;
			end
		end
	else
	path_ = [path_, 'n'];
		if labels(index) == 'r'
		hist_(4,1) = 1;
		else
		hist_(4,2) = 1;
		end
	end
else
path_ = [path_,'n'];
if labels(index) == 'r'
hist_(2,1) = 1;
else
hist_(2,2) = 1;
end
end

end

