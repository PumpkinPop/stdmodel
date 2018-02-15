
clear all; close all; clc

%% Introduction 

% This script is the second step, to calculate the energy as the imput of
% our later model;

addpath(genpath(fullfile(pwd,'data')));
save_address = fullfile(pwd, 'E' );

%% Load the data 


load stimuli_K;
stimuli_K = double(stimuli_K)./255 - .5;

load stimuli-2015-06-19.mat
 stimuli_69 = double(stimuli.imStack)./255 - .5;

load stimuli-2015-10-05.mat
stimuli_05 = double(stimuli.imStack)./255 - .5;

%% Integrate them into cell

% Create 
datacell = {stimuli_K, stimuli_05, stimuli_K};
labelall = {1:50 , 1:48 , 1:39};

%%  Set up the parameters

n=128;
sfvec = 2^5/3;
o = linspace(0,pi, 9);
thetavec = o(1:end-1);
nF=length(sfvec);
nO=length(thetavec);

[ Gabor_c, Gabor_s]=makeGaborFilter(n, sfvec, thetavec);

%%
for which_data = 1 : length(datacell)
    
    % Select the dataset
    data = datacell{which_data};
    labelVec = labelall{which_data};
    
    for ii= 1:length(labelVec)
        
        label = labelVec(ii)
        
        for ep = 1 : 9 % Each have 9 examples.
            
            ep
            
            % Since the dimensions are not the same
            if which_data == 3 
                stimulus_i = data( : , : , ep , label );
                stimulus = imresize(stimulus_i, .5);
            else
                stimulus = data( : , : , label , ep );
            end
            
            size_s = size(stimulus , 1);
       
            
            %Pad the stimulus to avoid edge effect
            padstimulus=zeros(size_s + 80, size_s + 80);
            padstimulus(41:size_s + 40,41:size_s + 40)=stimulus;
            stimulus=padstimulus;
            
            % Filtering and rectification to get the CONTRAST of the image
            con = squeeze(Icontrast(stimulus, Gabor_c, Gabor_s, sfvec, thetavec)); %3 - D x , y , theta
            
           % Get the size of e_1 
           size_con = size(con , 1);
           
           % Create a disk-like weight to prevent edge effect
           w = gen_disk( size( con ,  1 ) , size( con , 2 ) , size( con , 3 ));  %3 - D x , y , theta
           
          
            % Calculate E_ori for orientation-type model
            % Sum over space 
            E_ori = squeeze(mean(mean(w.*con , 2 ), 1)); % 1- D theta
            
            % Store the data into a matrix
            E_ori_sum( : ,  ep , ii , which_data) = E_ori'; 
            
            % Calculate E_space for space-type model
            % Sum over theta
            E_space = squeeze(mean(con , 3));
            
            % Assign the data into a matrix 
            E_space_sum( : , : , ep , ii , which_data) = E_space;
                       
        end
    end
end
%% The matrix is too large, so we split them into pieces for better storage

E_ori_69 = E_ori_sum( : , : , labelVec{1} , 1 );
E_xy_69 = E_space_sum( : , : , : , labelVec{1} , 1 );
E_ori_05 = E_ori_sum( : , : , labelVec{2}  , 2 );
E_xy_05 = E_space_sum( : , : , : , labelVec{2} , 2 );
E_ori_K = E_ori_sum( : , : , labelVec{3}  , 3 );
E_xy_K = E_space_sum( : , : , : , labelVec{3} , 3 );

%%
save([save_address, '\E_ori_69'] , 'E_ori_69')
save([save_address, '\E_xy_69'] , 'E_xy_69')
save([save_address, '\E_ori_05'] , 'E_ori_05')
save([save_address, '\E_xy_05'] , 'E_xy_05')
save([save_address, '\E_ori_K'] , 'E_ori_K')
save([save_address, '\E_xy_K'] , 'E_xy_K')


