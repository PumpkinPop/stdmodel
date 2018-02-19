function figureM1=plot_BOLD(which_data, all_prediction, legend_name)

figureM1=figure('units', 'normalized', 'outerposition', [0 0 1 1], 'color',[1 1 1]);

col_vector = {'k' , 'r' , 'b' , 'g' , 'c','y'};

addpath(genpath(fullfile(pwd,'data')));

switch which_data
    
    case {'Ca69_v1' , 'Ca69_v2' , 'Ca69_v3'}
        load v_mean_69
        switch which_data
            case 'Ca69_v1'
                v_mean = v_mean_69( 1 , : );
            case 'Ca69_v2'
                v_mean = v_mean_69( 2 , : );
            case 'Ca69_v3'
                v_mean = v_mean_69( 3 , : );
        end
        
        
        % Use bar plot to produce data
        
        b1 = bar(1:50 , v_mean);
        set(b1,'Facecolor', [.7, .7, .7])
        
        hold on
        for which_prediction = 1:size( all_prediction ,2)
            mVec = all_prediction(  : , which_prediction );
            mVec = mVec';
            col = col_vector{which_prediction};
            scatter(1:50,mVec,'filled','MarkerFaceColor', col)
            
        end
        legend('data', legend_name)
        
        for which_prediction = 1:size( all_prediction ,2)
            mVec = all_prediction(  : , which_prediction );
            mVec = mVec';
            col = col_vector{which_prediction};
            plot(1:5, mVec(1:5), col);
            hold on
            plot(6:10,mVec(6:10),col);
            hold on
            plot(11:15, mVec(11:15), col);
            hold on
            plot(16:21, mVec(16:21), col);
            hold on
            plot(22:24, mVec(22:24), col);
            hold on
            plot(25:27, mVec(25:27), col);
            hold on
            plot(28:30, mVec(28:30), col);
            hold on
            plot(31:34, mVec(31:34), col);
            hold on
            plot(35:38, mVec(35:38), col);
            hold on
            plot(39:42, mVec(39:42), col);
            hold on
            plot(43:46, mVec(43:46), col);
            hold on
            plot(47:50, mVec(47:50), col);
            hold on
            
        end
        
        
        
        set(gca,'xtick',[1, 6,11,16,22,25,28,31,35,39,43,47]);
        set(gca,'XTickLabel',{'Patterns-Sparsity','Grating-Sparsity','NoiseBars-Sparsity','Waves-Sparisity','Grating-Orientation','Noisebar-Orientation','Waves-Orientation','Grating-cross','Grating-Contrast','Noisebar-Contrast','Wave-Contrast','Pattern-Contrast'});
        
        h=gca;
        th=rotateticklabel(h,90);
        set (gca,'position',[0.1,0.2,.8,.75] );
        box off
        hold on
        g=max(v_mean)*1;
        
        line([5.4,5.4],[0,g])
        hold on
        line([10.4,10.4],[0,g])
        hold on
        line([15.4,15.4],[0,g])
        hold on
        line([21.4,21.4],[0,g])
        hold on
        line([24.4,24.4],[0,g])
        hold on
        line([27.4,27.4],[0,g])
        hold on
        line([30.4,30.4],[0,g])
        hold on
        line([30.4,30.4],[0,g])
        hold on
        line([34.4,34.4],[0,g])
        hold on
        line([38.4,38.4],[0,g])
        hold on
        line([42.4,42.4],[0,g])
        hold on
        line([46.4,46.4],[0,g])
        hold on
        line([50.4,50.4],[0,g])
        
        % Add a title
        ylabel('Predicted BOLD response')
        
        
    case { 'Ca05_v1' , 'Ca05_v2' , 'Ca05_v3'}
        
        load v_mean_05
        switch which_data
            case 'Ca05_v1'
                v_mean = v_mean_05( 1 , : );
            case 'Ca05_v2'
                v_mean = v_mean_05( 2 , : );
            case 'Ca05_v3'
                v_mean = v_mean_05( 3 , : );
        end
        % Use bar plot to produce data
        
        b1 = bar(1:48 , v_mean);
        set(b1,'Facecolor', [.7, .7, .7])
        
        hold on
        for which_prediction = 1:size( all_prediction ,2)
            mVec = all_prediction(  : , which_prediction );
            mVec = mVec';
            col = col_vector{which_prediction};
            scatter(1:48,mVec(1:48),'filled','MarkerFaceColor', col)
        end
        legend('data', legend_name)
        
        for which_prediction = 1:size( all_prediction ,2)
            mVec = all_prediction(  : , which_prediction );
            mVec = mVec';
            col = col_vector{which_prediction};
            hold on
            plot(1:5, mVec(1:5), col);
            hold on
            plot(6:10, mVec(6:10), col);
            hold on
            plot(11:15, mVec(11:15), col);
            hold on
            plot(16:19, mVec(16:19), col);
            hold on
            plot(20:22, mVec(20:22), col);
            hold on
            plot(23:25, mVec(23:25), col);
            hold on
            plot(26:28, mVec(26:28), col);
            hold on
            plot(29:32, mVec(29:32), col);
            hold on
            plot(33:36, mVec(33:36), col);
            hold on
            plot(37:40, mVec(37:40), col);
            hold on
            plot(41:44, mVec(41:44), col);
            hold on
            plot(45:48, mVec(45:48), col);
        end
        
        set(gca,'xtick',[1, 6,11,16,22,25,28,31,35,39,43,47]);
        set(gca,'XTickLabel',{'Patterns-Sparsity','Grating-Sparsity','NoiseBars-Sparsity','Waves-Sparisity','Grating-Orientation','Noisebar-Orientation','Waves-Orientation','Grating-cross','Grating-Contrast','Noisebar-Contrast','Wave-Contrast','Pattern-Contrast'});
        
        h=gca;
        th=rotateticklabel(h,90);
        set (gca,'position',[0.1,0.2,.8,.75] );
        box off
        hold on
        g=max(v_mean)*1.5;
        
        line([5.4,5.4],[0,g])
        hold on
        line([10.4,10.4],[0,g])
        hold on
        line([15.4,15.4],[0,g])
        hold on
        line([19.4,19.4],[0,g])
        hold on
        line([22.4,22.4],[0,g])
        hold on
        line([25.4,25.4],[0,g])
        hold on
        line([28.4,28.4],[0,g])
        hold on
        line([32.4,32.4],[0,g])
        hold on
        line([36.4,36.4],[0,g])
        hold on
        line([40.4,40.4],[0,g])
        hold on
        line([44.4,44.4],[0,g])
        hold on
        line([48.4,48.4],[0,g])
        
        
        
    case {'K1_v1' , 'K1_v2' , 'K1_v3'}
        load v_mean_K1
        v_mean = v2_mean_K1;
        
        % Use bar plot to produce data
        
        b1 = bar(1:39 , v_mean);
        set(b1,'Facecolor', [.7, .7, .7])
        
        hold on
        for which_prediction = 1:size( all_prediction ,2)
            mVec = all_prediction(  : , which_prediction );
            mVec = mVec';
            col = col_vector{which_prediction};
            scatter(1:39,mVec(1:39),'filled','MarkerFaceColor', col)
        end
        legend('data' , legend_name)
        
        for which_prediction = 1:size( all_prediction ,2)
            mVec = all_prediction(  : , which_prediction );
            mVec = mVec';
            col = col_vector{which_prediction};
            hold on
            plot(1:8, mVec(1:8), col );
            hold on
            plot(9:12,mVec(9:12), col );
            hold on
            plot(13:16, mVec(13:16), col );
            hold on
            plot(17:20, mVec(17:20), col );
            hold on
            plot(21:30, mVec(21:30), col );
            hold on
            plot(31:35, mVec(31:35), col );
            hold on
            plot(36:39, mVec(36:39), col );
            
        end
        
        set(gca,'xtick',[1, 9,13,17,21,31,36]);
        set(gca,'XTickLabel',{'Grating-Orientation','Grating-Contrast','Chess-Contrast','Dust-Contrast','Pattern-Contrast','Grating-Sparsity(-)','Pattern-Sparsity(-)'});
        
        h=gca;
        th=rotateticklabel(h,90);
        set (gca,'position',[0.1,0.2,.8,.75] );
        box off
        hold on
        g=max(v_mean)*1.5;
        
        line([8.4,8.4],[0,g])
        hold on
        line([12.4,12.4],[0,g])
        hold on
        line([16.4,16.4],[0,g])
        hold on
        line([20.4,20.4],[0,g])
        hold on
        line([30.4,30.4],[0,g])
        hold on
        line([35.4,35.4],[0,g])
        hold on
        
        % Add a title
        
        
    case 'K2'
        load v2_mean_K2
        v_mean = v2_mean_K2;
        
        % Use bar plot to produce data
        
        b1 = bar(1:39 , v_mean);
        set(b1,'Facecolor', [.7, .7, .7])
        
        hold on
        for which_prediction = 1:size( all_prediction ,2)
            mVec = all_prediction(  : , which_prediction );
            mVec = mVec';
            col = col_vector{which_prediction};
            scatter(1:39,mVec(1:39),'filled','MarkerFaceColor', col)
        end
        legend('data',legend_name)
        
        for which_prediction = 1:size( all_prediction ,2)
            mVec = all_prediction(  : , which_prediction );
            mVec = mVec';
            col = col_vector{which_prediction};
            hold on
            plot(1:8, mVec(1:8), col );
            hold on
            plot(9:12,mVec(9:12), col );
            hold on
            plot(13:16, mVec(13:16), col );
            hold on
            plot(17:20, mVec(17:20), col );
            hold on
            plot(21:30, mVec(21:30), col );
            hold on
            plot(31:35, mVec(31:35), col );
            hold on
            plot(36:39, mVec(36:39), col );
            
        end
        
        set(gca,'xtick',[1, 9,13,17,21,31,36]);
        set(gca,'XTickLabel',{'Grating-Orientation','Grating-Contrast','Chess-Contrast','Dust-Contrast','Pattern-Contrast','Grating-Sparsity(-)','Pattern-Sparsity(-)'});
        
        h=gca;
        th=rotateticklabel(h,90);
        set (gca,'position',[0.1,0.2,.8,.75] );
        box off
        hold on
        g=max(v_mean)*1.5;
        
        line([8.4,8.4],[0,g])
        hold on
        line([12.4,12.4],[0,g])
        hold on
        line([16.4,16.4],[0,g])
        hold on
        line([20.4,20.4],[0,g])
        hold on
        line([30.4,30.4],[0,g])
        hold on
        line([35.4,35.4],[0,g])
        hold on
        
        
    otherwise
        disp('Choose the right dataset')
end

end






