function figureM1=plot_K(which_data, all_prediction, legend_name)

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

b1 = bar(1:39 , v2_mean);
set(b1,'Facecolor', [.7, .7, .7])

hold on
for which_prediction = 1:size( all_prediction ,2)
    m2Vec = all_prediction(  : , which_prediction );
    m2Vec = m2Vec';
    col = col_vector{which_prediction};
    scatter(1:39,m2Vec(1:39),'filled','MarkerFaceColor', col)
end
legend(legend_name)

for which_prediction = 1:size( all_prediction ,2)
    m2Vec = all_prediction(  : , which_prediction );
    m2Vec = m2Vec';
    col = col_vector{which_prediction};
    hold on
    plot(1:8, m2Vec(1:8), col );
    hold on
    plot(9:12,m2Vec(9:12), col );
    hold on
    plot(13:16, m2Vec(13:16), col );
    hold on
    plot(17:20, m2Vec(17:20), col );
    hold on
    plot(21:30, m2Vec(21:30), col );
    hold on
    plot(31:35, m2Vec(31:35), col );
    hold on
    plot(36:39, m2Vec(36:39), col );
    
end

set(gca,'xtick',[1, 9,13,17,21,31,36]);
set(gca,'XTickLabel',{'Grating-Orientation','Grating-Contrast','Chess-Contrast','Dust-Contrast','Pattern-Contrast','Grating-Sparsity(-)','Pattern-Sparsity(-)'});

h=gca;
th=rotateticklabel(h,90);
set (gca,'position',[0.1,0.2,.8,.75] );
box off
hold on
g=max(v2_mean)*1.5;

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


end



