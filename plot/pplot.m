  function figureM1=pplot(m1Vec, m2Vec)
 x=[1:1:50];   
figureM1=figure;


hold on 
b1=bar(1:5, m1Vec(1:5));
hold on 
plot(1:5, m2Vec(1:5),'k');
set(b1,'Facecolor','m')
hold on 
b2=bar(6:10,m1Vec(6:10));
plot(6:10,m2Vec(6:10),'k');
set(b2,'Facecolor','b')
hold on 
b3=bar(11:15,m1Vec(11:15));
hold on 
plot(11:15, m2Vec(11:15),'k');
set(b3,'Facecolor','g')
hold on 
b4=bar(16:21, m1Vec(16:21));
hold on 
plot(16:21, m2Vec(16:21),'k');
set(b4,'Facecolor','y')
hold on 
b5=bar(22:24,m1Vec(22:24));
hold on 
plot(22:24, m2Vec(22:24),'k');
set(b5,'Facecolor','b')
hold on 
b6=bar(25:27,m1Vec(25:27));
hold on 
plot(25:27, m2Vec(25:27),'k');
set(b6,'Facecolor','g')
hold on 
b7=bar(28:30,m1Vec(28:30));
hold on 
plot(28:30, m2Vec(28:30),'k');
set(b7,'Facecolor','y')
hold on 
b8=bar(31:34, m1Vec(31:34));
hold on 
plot(31:34, m2Vec(31:34),'k');
set(b8,'Facecolor','b')
hold on 
b9=bar(35:38,m1Vec(35:38));
hold on 
plot(35:38, m2Vec(35:38),'k');
set(b9,'Facecolor','b')
hold on 
b10=bar(39:42,m1Vec(39:42));
hold on 
plot(39:42, m2Vec(39:42),'k');
set(b10,'Facecolor','g')
hold on 
b11=bar(43:46,m1Vec(43:46));
hold on 
plot(43:46, m2Vec(43:46),'k');
set(b11,'Facecolor','y')
hold on 
b12=bar(47:50, m1Vec(47:50));
hold on 
plot(47:50, m2Vec(47:50),'k');
set(b12,'Facecolor','m')

set(gca,'xtick',[1, 6,11,16,22,25,28,31,35,39,43,47]);
set(gca,'XTickLabel',{'Patterns-Sparsity','Grating-Sparsity','NoiseBars-Sparsity','Waves-Sparisity','Grating-Orientation','Noisebar-Orientation','Waves-Orientation','Grating-cross','Grating-Contrast','Noisebar-Contrast','Wave-Contrast','Pattern-Contrast'});

h=gca;
th=rotateticklabel(h,90);
set (gca,'position',[0.1,0.2,.8,.75] );
box off
hold on 
g=max(m1Vec)*1.5;

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

hold on
scatter(1:50,m2Vec,'filled','MarkerFaceColor','k')




