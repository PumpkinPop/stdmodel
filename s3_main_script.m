
clear all; close all;clc

%% Set up the dataset and the models we are going to test

alldataset = {'Ca69' , 'Ca05' , 'K1' , 'K2'};
allmodel = {'e' ,  'std' , 'var' , 'power'};%   , 'Disk_SOC' , 'Gauss_SOC'
alltype = {'orientation' , 'orientation' , 'orientation' , 'orientation' };% 'space' , 'space' , 'space'};

% How many random start points.
fittime  = 3;

%% Predict the BOLD response of given stimuli

% Create empty matrix
para_summary = zeros(3 , 50 , size(allmodel , 2) , size(alldataset , 2));
pred_summary = zeros(50 , size(allmodel , 2) , size(alldataset , 2));
Rsqu_summary =  zeros(1 , size(allmodel , 2) , size(alldataset , 2));


for data_index = 1: size(alldataset , 2)
    
    % Select the dataset
    which_data = alldataset{data_index}
    
    for model_index = 1:size(allmodel , 2)
        
        % Select the model
        which_model = allmodel{model_index}
        
        % Select the type of the model
        which_type = alltype{model_index};
        
        % Make predictions
        [ parameters , BOLD_prediction , Rsquare ]=cross_validation(which_data, which_model, which_type , fittime);
        
        % Parameters
        para_summary( : , 1:size(BOLD_prediction, 2) , model_index , data_index) = parameters';
        % BOLD_predictions
        pred_summary(1:size(BOLD_prediction, 2) , model_index , data_index) = BOLD_prediction;
        % Rsquare
        Rsqu_summary(: , model_index , data_index) = Rsquare;
               
    end
    
end

pred_summary(1:50 , 5 , 1) = BOLD_prediction_69;
%% Predict BOLD response of SOC model

% load data
load e_xy_69m;
load v2_mean_69;
w_d = gen_disk(size(e_xy_69m , 1) , size(e_xy_69m , 3), size(e_xy_69m , 4) - 1, 'disk');
 [ parameters_69 , BOLD_prediction_69 , Rsquare_69 ]=cross_validation('new', 'SOC', 'space' , fittime, v2_mean_69, e_xy_69m , w_d);

%% Save the results 

save('para_summary' , 'para_summary');
save('pred_summary' , 'pred_summary');
save('Rsqu_summary' , 'Rsqu_summary');

%%
save('parameters_69' , 'parameters_69');
save('BOLD_prediction_69' , 'BOLD_prediction_69');
save('Rsquare_69' , 'Rsquare_69');

%% Plot the result

addpath(genpath(fullfile(pwd,'plot')));

legend_name = {'data', 'Contrast' , 'NormStd' , 'NormVar' , 'NormPower' , 'SOC'};

for data_index = 1%: size(alldataset , 2)
     
    % Select the dataset
    which_data = alldataset{data_index};
    
    plot_BOLD(which_data , pred_summary(: , : , data_index) , legend_name);
    
    title('V2')
end



