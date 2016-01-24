function [states,probability] = viterbi(hmm,sequence)

probability_table = [];
first_letter_index = find(hmm.alphabet == sequence(1));

for i=1:size(hmm.transition_matrix,1)
	probability_table(i,1) = hmm.initial_distribution(i) * hmm.emmision_matrix(i,first_letter_index);
end

for i=1:size(hmm.transition_matrix,1)
	for j=2:length(sequence)
		for k=1:size(hmm.transition_matrix,1)
			temp(k) = probability_table(k,j-1) * hmm.transition_matrix(k,i);
		end
		probability_table(i,j) = hmm.emmision_matrix(i,find(hmm.alphabet == sequence(j))) * max(temp);
		
	end
end

%calculate most likely sequence of states
for i=1:length(sequence)
	states(i) = find(probability_table(:,i) == max(probability_table(:,i)));
end


%calculate the probability of the most likely sequence of states
probability = hmm.initial_distribution(states(1));
for i=1:length(sequence)-1
	probability = probability * hmm.transition_matrix(states(i),states(i+1));
end

end