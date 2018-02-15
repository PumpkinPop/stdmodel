function sumSSE = FUNF(x, E, v2_mean, which_model, which_type ,w_d)

switch which_type
    case 'orientation'
        w= x(1);
        g = x(2);
        n = x(3);
        
        switch which_model
            case 'e'
                % Energy model
                d = E;% ori x examples x stimuli
            case 'std'
                % std model
                d = E ./(1+ w.*std(E, 1));% ori x examples x stimuli
            case 'var'
                % var model
                d = E.^2 ./(1+w^2.*var(E, 1));% ori x examples x stimuli
            case 'power'
                % square model
                d = E.^2 ./(1 + w^2.*mean(E.^2 , 1)); % ori x examples x stimuli
            otherwise
                disp('Please select the right model')
        end
        
        % sum over orientation
        s = squeeze(mean(d , 1)) ; % examples x stimuli
        
    case 'space'
        c = x(1);
        g = x(2);
        n = x(3);
        
        switch which_model
            case 'SOC'
                % Do a variance-like calculation
                v =  (E - c*mean(mean(E, 1) , 2)).^2; % X x Y x ep x stimuli
                d = w_d.*v;
            case 'Gauss_SOC'
               
        end
        
                % Create a disk as weight
        
        
        % Sum over spatial position
        s = squeeze(mean(mean( d , 1) , 2)); % ep x stimuli
        
        
    otherwise
        disp('Right model')
end

% Nonlinearity
BOLD_prediction_ind = g.*s.^n; % ep x stimuli

% Sum over different examples
BOLD_prediction = squeeze(mean(BOLD_prediction_ind, 1)); % stimuli

% Ensure that the size of BOLD_prediction and v2_mean are the
% same
if isequal( size(v2_mean) , size(BOLD_prediction)) == 0
    BOLD_prediction = BOLD_prediction';
end

% Compare with the data
SSE=(v2_mean - BOLD_prediction).^2;

sumSSE=double(sum(SSE));

