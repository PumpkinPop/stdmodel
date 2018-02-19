  function figureM1=pplot48(m1Vec, err , m2Vec)
 x=[1:1:48];   
figureM1=figure;


hold on 
b1=bar(1:5, m1Vec(1:5));
set(b1,'Facecolor','m')
hold on 
plot(1:5, m2Vec(1:5),'k');
hold on 
b2=bar(6:10,m1Vec(6:10));
set(b2,'Facecolor','b')
hold on 
plot(6:10, m2Vec(6:10),'k');
hold on 
b3=bar(11:15,m1Vec(11:15));
set(b3,'Facecolor','g')
hold on 
plot(11:15, m2Vec(11:15),'k');
hold on 
b4=bar(16:19, m1Vec(16:19));
set(b4,'Facecolor','y')
hold on 
plot(16:19, m2Vec(16:19),'k');
hold on 
b5=bar(20:22,m1Vec(20:22));
set(b5,'Facecolor','b')
hold on 
plot(20:22, m2Vec(20:22),'k');
hold on 
b6=bar(23:25,m1Vec(23:25));
set(b6,'Facecolor','g')
hold on 
plot(23:25, m2Vec(23:25),'k');
hold on 
b7=bar(26:28,m1Vec(26:28));
set(b7,'Facecolor','y')
hold on 
plot(26:28, m2Vec(26:28),'k');
hold on 
b8=bar(29:32, m1Vec(29:32));
set(b8,'Facecolor','b')
hold on 
plot(29:32, m2Vec(29:32),'k');
hold on 
b9=bar(33:36,m1Vec(33:36));
set(b9,'Facecolor','b')
hold on 
plot(33:36, m2Vec(33:36),'k');
hold on 
b10=bar(37:40,m1Vec(37:40));
set(b10,'Facecolor','g')
hold on 
plot(37:40, m2Vec(37:40),'k');
hold on 
b11=bar(41:44,m1Vec(41:44));
set(b11,'Facecolor','y')
hold on 
plot(41:44, m2Vec(41:44),'k');
hold on 
b12=bar(45:48, m1Vec(45:48));
set(b12,'Facecolor','m')
hold on 
plot(45:48, m2Vec(45:48),'k');

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

hold on
scatter(1:48,m2Vec,'filled','MarkerFaceColor','k')
hold on 
errorbar(1:48, m1Vec, err, 'vertical', '.')



