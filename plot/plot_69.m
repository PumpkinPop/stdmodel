function figureM1=plot_69(which_data, all_prediction, legend_name)

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

% Use bar plot to produce data

b1 = bar(1:50 , v2_mean);
set(b1,'Facecolor', [.7, .7, .7])

hold on
for which_prediction = 1:size( all_prediction ,2)
    m2Vec = all_prediction(  : , which_prediction );
    m2Vec = m2Vec';
    col = col_vector{which_prediction};
    scatter(1:50,m2Vec,'filled','MarkerFaceColor', col)

end
legend(legend_name)

for which_prediction = 1:size( all_prediction ,2)
    m2Vec = all_prediction(  : , which_prediction );
    m2Vec = m2Vec';
    col = col_vector{which_prediction};
    plot(1:5, m2Vec(1:5), col);
    hold on
    plot(6:10,m2Vec(6:10),col);    
    hold on
    plot(11:15, m2Vec(11:15), col);
    hold on
    plot(16:21, m2Vec(16:21), col);
    hold on
    plot(22:24, m2Vec(22:24), col);
    hold on
    plot(25:27, m2Vec(25:27), col);
    hold on
    plot(28:30, m2Vec(28:30), col);
    hold on
    plot(31:34, m2Vec(31:34), col);
    hold on
    plot(35:38, m2Vec(35:38), col);
    hold on
    plot(39:42, m2Vec(39:42), col);
    hold on
    plot(43:46, m2Vec(43:46), col);
    hold on
    plot(47:50, m2Vec(47:50), col);
    hold on
    
end



set(gca,'xtick',[1, 6,11,16,22,25,28,31,35,39,43,47]);
set(gca,'XTickLabel',{'Patterns-Sparsity','Grating-Sparsity','NoiseBars-Sparsity','Waves-Sparisity','Grating-Orientation','Noisebar-Orientation','Waves-Orientation','Grating-cross','Grating-Contrast','Noisebar-Contrast','Wave-Contrast','Pattern-Contrast'});

h=gca;
th=rotateticklabel(h,90);
set (gca,'position',[0.1,0.2,.8,.75] );
box off
hold on
g=max(v2_mean)*1;

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
title('fitting for dataset 619')

end






