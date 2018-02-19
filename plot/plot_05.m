function figureM1=plot_05(which_data, all_prediction, legend_name)

figureM1=figure;

switch which_data
    
    case 'Ca69'
        load v2_mean_69
        v2_mean = v2_mean_69;
        
    case 'Ca05'
        load v2_mean_05
        v2_mean = v2_mean_05;
        
    case 'K1'
        load v2_mean_K
        v2_mean = v2_mean_K;
        
    case 'K2'
        load v2_mean_K2
        v2_mean = v2_mean_K2;
        
    otherwise
        disp('Choose the right dataset')
end

col_vector = {'k' , 'r' , 'b' , 'm' , 'g'};



end



