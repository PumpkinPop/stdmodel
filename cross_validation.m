function [ para_set , BOLD_prediction , Rsquare ]=cross_validation(which_data, which_model, which_type, fittime, v2_mean_op , data_op , w_d)

addpath(genpath(fullfile(pwd,'data')));
addpath(genpath(fullfile(pwd,'E')));
% Load the data and create a vector to knock out the

switch which_data
    case {'Ca69_v1' , 'Ca69_v2' , 'Ca69_v3'}
        load E_ori_69
        E_test = E_ori_69;
        knock_out = [1:50];
        
        switch which_data
            case 'Ca69_v1'
                load v2_mean_69
                v2_mean = v2_mean_69;
            case 'Ca69_v2'
                load v1_mean_69
                v2_mean = v1_mean_69;
            case 'Ca69_v3'
                load v3_mean_69
                v2_mean = v3_mean_69;
        end
                
    case {'Ca05_v1' , 'Ca05_v2' , 'Ca05_v3'}
        
        load E_ori_05;
        E_test = E_ori_05;
        knock_out = [1:48];
        
        switch which_data
            case 'Ca05_v1'
                load v2_mean_05
                v2_mean = v2_mean_05;
            case 'Ca05_v2'
                load v1_mean_05
                v2_mean = v1_mean_05;
            case 'Ca05_v3'
                load v3_mean_05
                v2_mean = v3_mean_05;
        end
        
        
    case {'K1_v1' , 'K1_v2' , 'K1_v3', 'K2_v1' , 'K2_v2' , 'K2_v3'}
        load E_ori_K;
        E_test=  E_ori_K;
        knock_out = [1:39];
        
        switch which_data
            case 'K1_v1'
                load v2_mean_K
                v2_mean = v2_mean_K;
            case 'K1_v2'
                load v1_mean_K1
                v2_mean = v1_mean_K1;
            case 'K1_v3'
                load v3_mean_K1
                v2_mean = v3_mean_K1;
            case 'K2_v1'
                load v2_mean_K2
                v2_mean = v2_mean_K2;
            case 'K2_v2'
                load v1_mean_K2
                v2_mean = v1_mean_K2;
            case 'K2_v3'
                load v3_mean_K2
                v2_mean = v3_mean_K2;
        end
               
    case 'new'
        v2_mean = v2_mean_op;
        E_test = data_op;
        knock_out = [1 : size(v2_mean , 2)];
        
    otherwise
        disp('Choose the right dataset')
end



for knock_index  = knock_out
    
    switch which_type
        case 'orientation'
            
            % Show where we are
            knock_index
            
            if knock_index ==1
                E_vali = E_test(: , :  , 2:end);
                mean_vali = v2_mean(2:end);
            elseif knock_index == knock_out(end)
                E_vali = E_test(: , :  ,1:end-1);
                mean_vali = v2_mean(1:end-1);
            else
                E_vali = E_test( : , : , [1:knock_index-1, knock_index + 1:end]);
                mean_vali = v2_mean([1:knock_index-1, knock_index + 1:end]);
            end
            
            para = cal_prediction('new', which_model, which_type, fittime ,mean_vali , E_vali);
            
            bench_predction(knock_index) = squeeze(mean(E_vali(:)) );% mean(ori x example) x 1
            
            % Assign the parameter
            w = para(1);
            g = para(2);
            n = para(3);
            
            % Use the previous parameter to predict the knock_outed stimuli
            
            
            % Assign into the right dataset
            E_ori = E_test(: , :  ,knock_index); % ori x example x 1
            
            % calculate normalized energy cording the model  we choose
            switch which_model
                case 'c'
                    % Energy model
                    d = E_ori; % ori x example x 1
                case 'std'
                    % std model
                    d = E_ori ./(1 + w.*std(E_ori , 1)); % ori x example x 1
                case 'var'
                    % var model
                    d = E_ori.^2 ./(1 + w^2.*var(E_ori, 1)); % ori x example x 1
                case 'power'
                    d = E_ori.^2./( 1 + w^2.*mean(E_ori.^2, 1)); % ori x example x 1
                otherwise
                    disp('Please select the right model')
            end
            
            % sum over orientation
            s = squeeze(mean(d , 1));  %  example x 1
 
        case 'space'        
            
            % Show where we are
            knock_index
            
            if knock_index ==1
                E_vali = E_test(: , :  , : , 2:end); % x x y x ep x stimuli
                mean_vali = v2_mean(2:end);
            elseif knock_index == knock_out(end)
                E_vali = E_test(: , :  , : , 1:end-1);
                mean_vali = v2_mean(1:end-1);
            else
                E_vali = E_test( : , : , : , [1:knock_index-1, knock_index + 1:end]);
                mean_vali = v2_mean([1:knock_index-1, knock_index + 1:end]);
            end
            
            para = cal_prediction('new', which_model, which_type, fittime ,mean_vali , E_vali , w_d);
                        
            % Assign the parameter
            c = para(1);
            g = para(2);
            n = para(3);
            
            % Use the previous parameter to predict the knock_outed stimuli
            
            % Assign into the right dataset
            E_space = E_test( : , :  , : , knock_index); % ori x example x 1
            
            % Do a variance-like calculation
            v =  (E_space - c*mean(mean(E_space, 1) , 2)).^2; % X x Y x ep x stimuli
            
            % Create a disk as weight
            w = gen_disk(size(E_space , 1) , size(E_space , 3), 1 , 'disk');
            d = w.*v; % X x Y x ep x 1
            
            % Sum over spatial position
            s = squeeze(mean(mean( d , 1) , 2)); % ep x 1
    end
    
    % Nonlinearity
    BOLD_prediction_ind = g.*s.^n; % ep x 1
    
    % Sum over different examples
    BOLD_prediction(knock_index) = squeeze(mean(BOLD_prediction
    _ind)); % scalar
    
    % Collect the parameters
    para_set( knock_index, :) = para;
    
end

if isequal( size(v2_mean) , size(BOLD_prediction)) == 0
    BOLD_prediction = BOLD_prediction';
end

% calculate the Rsquare
Rsquare= 1 - var(v2_mean - BOLD_prediction)/var(v2_mean);

end