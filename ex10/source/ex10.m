%create hmm data structure

field1 = 'alphabet';  value1 ='abc';
field2 = 'initial_distribution';  value2 = [1/3,1/3,1/3];
field3 = 'transition_matrix';  value3 = [0.4,0.5,0.1;0.4,0.1,0.5;0.3,0.1,0.6];
field4 = 'emmision_matrix';  value4 = [0.6,0.1,0.3;0.5,0.4,0.1;0.05,0.15,0.8];
hmm = struct(field1,value1,field2,value2,field3,value3,field4,value4);

