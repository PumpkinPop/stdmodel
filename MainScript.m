
clear all; close all;clc

%% Set up the dataset and the models we are going to test

alldataset = {'Ca69_v3' , 'Ca05_v3' , 'K1_v3' , 'K2_v3'};
allmodel = {'e' ,  'std' , 'var' , 'power'};%   , 'Disk_SOC' , 'Gauss_SOC'
alltype = {'orientation' , 'orientation' , 'orientation' , 'orientation' };% 'space' , 'space' , 'space'};

% How many random start points.
fittime  = 3;

%% Predict the BOLD response of given stimuli

% Create empty matrix


for data_index = 2: size(alldataset , 2)
    
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

%% Predict BOLD response of SOC model
fittime=3;
% load data
load e_xy_km;
load v3_mean_K1;
w_d = gen_disk(size(e_xy_Km , 1) , size(e_xy_Km , 3), size(e_xy_Km , 4) - 1, 'disk');
 [ parameters_K1_v3 , BOLD_prediction_K1_v3 , Rsquare_K1_v3 ]=cross_validation('new', 'SOC', 'space' , fittime, v3_mean_K1, e_xy_Km , w_d);

%% Save the results 

save('parameters_K2_v3' , 'parameters_K2_v3')
save('BOLD_prediction_K2_v3' , 'BOLD_prediction_K2_v3')
save('Rsquare_K2_v3' , 'Rsquare_K2_v3')
%%
save('para_summary' , 'para_summary');
save('pred_summary' , 'pred_summary');
save('Rsqu_summary' , 'Rsqu_summary');

%% Plot the result

addpath(genpath(fullfile(pwd,'plot')));

legend_name = {'data', 'contrast' , 'NormStd' , 'NormVar' , 'NormPower' , 'SOC'};

for data_index = 1: size(alldataset , 2)
     
    % Select the dataset
    which_data = alldataset{data_index};
    
    plot_BOLD(which_data , pred_summary(: , : , data_index) , legend_name);
    
end



