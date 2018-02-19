%%

close all; clear all; clc
%% Load the data

addpath(genpath(fullfile(pwd,'data')));

load stimuli

%% 

labelVec = [[139:168], [176:184]];

for ii = 1:length(labelVec)
    label = labelVec(ii);
    stimuli_K(: , : , : , ii) = images{1 , label};
end

%% 

save('stimuli_K' , 'stimuli_K')