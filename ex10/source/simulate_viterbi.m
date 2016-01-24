function states = simulate_viterbi(hmm,observation)

k=1;
%100000 simulations
for i=1:100000
sequence{i} = simulate(hmm,length(observation));

%find the sequences which are the same as our observation
c = 0;
for j=1:length(observation)
	if observation(j) == sequence{i}{j}(2)
	c = c + 1;
	else
	break
	end
end
	if c==length(observation)
	out{k} = sequence{i};
	k = k + 1;
	end

end

%use a histogram to count the states which lead to the observation sequence
hist = zeros(size(hmm.transition_matrix,1),length(observation));
for i=1:k-1
		for j=1:length(observation)
			hist(str2num(out{i}{j}(1)),j) = hist(str2num(out{i}{j}(1)),j) + 1;
	end
end

%return the most probable states which lead to the observation sequence
for i=1:length(observation)
	states(i) = find(hist(:,i) == max(hist(:,i)));
end

end

