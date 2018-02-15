function [ para, BOLD_prediction, Rsquare ] = cal_prediction( which_data, which_model, which_type, fittime ,v2_mean_op , data_op ,w_d)
% This function is used to calculate the BOLD prediction of each dataset.

% Load the dataset for our training the model

% Go foward to the right fold to get the data
addpath(genpath(fullfile(pwd,'data')));

% load the right trainning data according to the dataset we choose
switch which_data
    
    case {'Ca69_v1' , 'Ca69_v2' , 'Ca69_v3'}
        
        load v_mean_69
        switch which_data
            case 'Ca69_v1'
                v_mean = v_mean_69(1 , : );
            case 'Ca69_v2'
                v_mean = v_mean_69(2 , : );
            case 'Ca69_v3'
                v_mean = v_mean_69(3 , : );
        end
        
    case {'Ca05_v1' , 'Ca05_v2' , 'Ca05_v3'}
        
        load v_mean_05;
        switch which_data
            case 'Ca05_v1'
                v_mean = v_mean_05(1 , : );
            case 'Ca05_v2'
                v_mean = v_mean_05(2 , : );
            case 'Ca05_v3'
                v_mean = v_mean_05(3 , : );
        end
        
    case { 'K1_v1' , 'K1_v2' , 'K1_v3' }
        
        load v_mean_K1;
        switch which_data
            case 'K1_v1'
                v_mean = v_mean_K1(1 , : );
            case 'K1_v2'
                v_mean = v_mean_K1(2 , : );
            case 'K1_v3'
                v_mean = v_mean_K1(3 , : );
        end
        
    case { 'K2_v1' , 'K2_v2' , 'K2_v3' }
        
        load v_mean_K2
        switch which_data
            case 'K2_v1'
                v_mean = v_mean_K2( 1 , : );
            case 'K2_v2'
                v_mean = v_mean_K2(2 , : );
            case 'K2_v3'
                v_mean = v_mean_K2(3 , : );
        end
        
    case 'new'
        v_mean = v2_mean_op;
        
    otherwise
        disp('Choose the right dataset')
end

% load  input of our model

% Go forwads to the right fold
addpath(genpath(fullfile(pwd,'E')));

switch which_type
    
    % Load the input of the model according to the kinds of model we choose
    case 'orientation'
        
        % Because this is a model care much about the variance of the
        % orientation, we load Etot
        switch which_data
            case {'Ca69_v1' , 'Ca69_v2' , 'Ca69_v3'}
                load E_ori_69;
                E_ori = E_ori_69;
                
            case {'Ca05_v1' , 'Ca05_v2' , 'Ca05_v3'}
                load E_or_05
                E_ori = E_ori_05;
                
            case {'K1_v1' , 'K1_v2' , 'K1_v3' , 'K2_v1' , 'K2_v2' , 'K2_v3'}
                load E_ori_K;
                E_ori = E_ori_K;
                
            case 'new'
                E_ori = data_op;
                
            otherwise
                disp('input the right data')
        end
        
        % Then we begin our model fitting with random start point.
        
        % Set up the random start points.
        % Set up the boundary of paramters
        LB= [ 0, 0, 0];
        UB= [200, 700, 10];
        PLB= [0.00005, 0, 0];
        PUB=[150, 10, 2];
        
        % Random the start point
        x0_w = LB(1) + (UB(1) - LB(1))*rand(fittime, 1);
        x0_g = LB(2) + (UB(2) - LB(2))*rand(fittime, 1);
        x0_n = LB(3) + (UB(3) - LB(3))*rand(fittime, 1);
        
        % Integrate them into sets
        x0_set = [x0_w, x0_g, x0_n];
        
        % Choose the which model we are going to fit and assign it into
        % the function
        fun=@(x) FUNF(x, E_ori, v_mean, which_model , 'orientation' );
        
        % Run n times with multiple start points
        for ii = 1: size(x0_set, 1)
            
            % Sign
            ii
            
            % Find the optimal point with BADS
            [x(ii, :), SSE(ii)]=bads(fun,  x0_set(ii, :), LB, UB, PLB, PUB);
            %[x(ii, :), SSE(ii)]=fmincon(fun,  x0_set(ii, :), [], [], [],[], LB, UB);
            %[x(ii, :), SSE(ii)]=fminsearch(fun,  x0_set(ii, :));
            
        end
        
        % find the lowest SSE
        trials = find(SSE == min(SSE));
        para(:) = x(trials(1), :);
        
        % Assign the parameter
        w = para(1);
        g = para(2);
        n = para(3);
        
        % calculate normalized energy cording the model  we choose
        switch which_model
            case 'e'
                % Energy model
                d = E_ori; % ori x example x stimili
            case 'std'
                % std model
                d = E_ori ./(1 + w.*std(E_ori , 1)); % ori x example x stimili
            case 'var'
                % var model
                d = E_ori.^2 ./(1 + w^2.*var(E_ori, 1)); % ori x example x stimili
            case 'power'
                d = E_ori.^2./( 1 + w^2.*mean(E_ori.^2, 1)); % ori x example x stimili
            otherwise
                disp('Please select the right model')
        end
        
        
        
        % sum over orientation
        s = squeeze(mean(d , 1)) ; %  example x stimili
        
    case 'space'
        switch which_data
            case {'Ca69_v1' , 'Ca69_v2' , 'Ca69_v3'}
                load e_xy_69;
                E_space = e_xy_69;
                
            case {'Ca05_v1' , 'Ca05_v2' , 'Ca05_v3'}
                load e_xy_05;
                E_space = e_xy_05;
                
            case {'K1_v1' , 'K1_v2' , 'K1_v3' , 'K2_v1' , 'K2_v2' , 'K2_v3'}
                load e_xy_K;
                E_space = e_xy_K;
                               
            case 'new'
                E_space = data_op;
                
            otherwise
                disp('Please select the right mode for fitting')
        end
        
        %DISK
        
        % Set up the random start points.
        % Set up the boundary of paramters
        LB= [ 0, 0, 0];
        UB= [3, 100, 10];
        PLB= [0.00005, 0, 0];
        PUB=[1, 10, 2];
        
        % Random the start point
        x0_c = LB(1) + (UB(1) - LB(1))*rand(fittime, 1);
        x0_g = LB(2) + (UB(2) - LB(2))*rand(fittime, 1);
        x0_n = LB(3) + (UB(3) - LB(3))*rand(fittime, 1);
        
        % Integrate them into sets
        x0_set = [x0_c, x0_g, x0_n];
        
        % Choose the which model we are going to fit and assign it into
        % the function
        fun=@(x) FUNF(x, E_space, v_mean, which_model, 'space', w_d);
        
        % Run n times with multiple start points
        for ii = 1: size(x0_set, 1)
            
            % Sign
            ii
            
            % Find the optimal point with BADS
            [x(ii, :), SSE(ii)]=bads(fun,  x0_set(ii, :), LB, UB, PLB, PUB);
            %[x(ii, :), SSE(ii)]=fmincon(fun,  x0_set(ii, :), [], [], [],[], LB, UB);
            %[x(ii, :), SSE(ii)]=fminsearch(fun,  x0_set(ii, :));
            
        end
        
        % find the lowest SSE
        trials = find(SSE == min(SSE));
        para(:) = x(trials(1), :);
        
        % Assign the parameter
        c = para(1);
        g = para(2);
        n = para(3);
        
        switch which_model
            case 'SOC'
                % Do a variance-like calculation
                v =  (E_space - c*mean(mean(E_space, 1) , 2)).^2; % X x Y x ep x stimuli
                
                % Create a disk as weight
                
                d = w_d.*v; % X x Y x ep x stimuli
                
            otherwise
                disp('choose the right model')
        end
        
        % Sum over spatial position
        s = squeeze(mean(mean( d , 1) , 2)); % ep x stimuli
        
    otherwise
        disp('Please select the right mode for fitting')
end

% Nonlinearity
BOLD_prediction_ind = g.*s.^n; % ep x stimuli

% Sum over different examples
BOLD_prediction = squeeze(mean(BOLD_prediction_ind, 1)); % stimuli

% Ensure that the size of BOLD_prediction and v2_mean are the
% same
if isequal( size(v_mean) , size(BOLD_prediction)) == 0
    BOLD_prediction = BOLD_prediction';
end

% calculate the Rsquare
Rsquare= 1 - var(v_mean - BOLD_prediction)/var(v_mean);

end

