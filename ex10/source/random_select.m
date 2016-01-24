%sequence should be a row vector
function [index] = random_select(sequence)

	indices = 1:size(sequence,2);

	index = indices(find(rand<cumsum(sequence),1,'first'));

end


