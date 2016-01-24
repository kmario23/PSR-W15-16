function sequence = simulate(hmm,max_t)

%initial_state
state = random_select(hmm.initial_distribution);
emmision = hmm.alphabet(random_select(hmm.emmision_matrix(state,:)));

pair(1) = num2str(state);
pair(2) = emmision;
sequence{1} = pair;

for i=2:max_t

state = random_select(hmm.transition_matrix(state,:));
emmision = hmm.alphabet(random_select(hmm.emmision_matrix(state,:)));

pair(1) = num2str(state);
pair(2) = emmision;
sequence{i} = pair;

end

end

