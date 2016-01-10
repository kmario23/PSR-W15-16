clc;
close all;

%histogram plot of the dataset
filename = 'corpus_duration.csv';
fid = fopen(filename);
D = textscan(fid, '%s %f', 'Delimiter', '\t');

nbins = 1000;
hist(D{2}, nbins);
figure(1);
title('Data distribution');
xlabel('Duration (ms)'); 
ylabel('Number of samples');
