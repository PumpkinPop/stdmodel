  function figureM1=pplotK(m1Vec, err, m2Vec)
 x=[1:1:50];   
figureM1=figure;


hold on 
b1=bar(1:8, m1Vec(1:8));
hold on 
plot(1:8, m2Vec(1:8),'k');
set(b1,'Facecolor','b')
hold on 
b2=bar(9:12,m1Vec(9:12));
plot(9:12,m2Vec(9:12),'k');
set(b2,'Facecolor','b')
hold on 
b3=bar(13:16,m1Vec(13:16));
hold on 
plot(13:16, m2Vec(13:16),'k');
set(b3,'Facecolor','g')
hold on 
b4=bar(17:20, m1Vec(17:20));
hold on 
plot(17:20, m2Vec(17:20),'k');
set(b4,'Facecolor','y')
hold on 
b5=bar(21:30,m1Vec(21:30));
hold on 
plot(21:30, m2Vec(21:30),'k');
set(b5,'Facecolor','m')
hold on 
b6=bar(31:35,m1Vec(31:35));
hold on 
plot(31:35, m2Vec(31:35),'k');
set(b6,'Facecolor','b')
hold on 
b7=bar(36:39,m1Vec(36:39));
hold on 
plot(36:39, m2Vec(36:39),'k');
set(b7,'Facecolor','m')


set(gca,'xtick',[1, 9,13,17,21,31,36]);
set(gca,'XTickLabel',{'Grating-Orientation','Grating-Contrast','Chess-Contrast','Dust-Contrast','Pattern-Contrast','Grating-Sparsity(-)','Pattern-Sparsity(-)'});

h=gca;
th=rotateticklabel(h,90);
set (gca,'position',[0.1,0.2,.8,.75] );
box off
hold on 
g=max(m1Vec)*1.5;

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

hold on
scatter(1:39,m2Vec,'filled','MarkerFaceColor','k')
hold on 
%errorbar(1:39, m1Vec, err, 'vertical', '.')



