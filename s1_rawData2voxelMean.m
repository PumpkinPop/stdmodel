clear all; close all; clc

% This script is create to collect the target data from raw dataset

%%
% Add path of data to the script
addpath(genpath(fullfile(pwd,'data')));
save_address = fullfile(pwd, 'data' );

%% Load Dataset 1 (Catherine 06-19)

load roiBetas

% v1 mean ( voxel _ mean _ dataset)
v_mean_69( 1 , : ) = roiBetas.roiBetamn{11};

% v2 mean 
v_mean_69( 2 , : ) = roiBetas.roiBetamn{12};

% v3 mean
v_mean_69( 3 , : ) = roiBetas.roiBetamn{13};

% save
save([save_address , '\v_mean_69'] , 'v_mean_69') 

% delete the variable to save up memory 
clear ( 'roiBetas')

%% Load Dataset 2 (Catherine 10-05)

load roiBetas2

% v1 mean 
v_mean_05( 1 , : ) = (roiBetas.roiBetamn{1} + roiBetas.roiBetamn{5})./2;

% v2 mean 
v_mean_05( 2 , : ) = (roiBetas.roiBetamn{2} + roiBetas.roiBetamn{6})./2;

% v3 mean
v_mean_05( 3 , : ) = (roiBetas.roiBetamn{3} + roiBetas.roiBetamn{7})./2;

% save
save([save_address , '\v_mean_05'] , 'v_mean_05') 

% delete the variable to save up memory 
clear ( 'roiBetas')

%% Load Dataset 3 (Kendrick dataset 3)

% Choose the right stimuli we need 
labelVec_K = [[70:1:99],[107:1:115]];

% load data
load dataset03

% v1 mean
v_mean_K1( 1 , : ) = mean(betamn(roi==2 , labelVec_K));

% v2 mean 
v_mean_K1( 2 , : ) = mean(betamn(roi==3 , labelVec_K));

% v3 mean 
v_mean_K1( 3 , : ) = mean(betamn(roi==4 , labelVec_K));

% save 
save([save_address , '\v_mean_K1'] , 'v_mean_K1') 

%% Load Dataset 4 (Kendrick dataset 4)

% Choose the right stimuli we need 
labelVec_K = [[70:1:99],[107:1:115]];

% load data
load dataset04

% v1 mean
v_mean_K2( 1 , : ) = mean(betamn(roi==2 , labelVec_K));

% v2 mean 
v_mean_K2( 2 , : ) = mean(betamn(roi==3 , labelVec_K));

% v3 mean 
v_mean_K2( 3 , : ) = mean(betamn(roi==4 , labelVec_K));

% save 
save([save_address , '\v_mean_K2'] , 'v_mean_K2') 



