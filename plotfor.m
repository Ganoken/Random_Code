clf;
fontsize=16;
fontsize2=20;
unit_m2mm=1e6;
%====================================%

set(gcf,'renderer','painter');


figure
plot(1.5-xcord1*1000,yvalu1,'-or',2.0-xcord2*1000,yvalu2,'-sb',2.5-xcord3*1000,yvalu3,'-^k','LineWidth',0.01); hold on;
plot([-1000 1000], [1 1], '--r','LineWidth',1.5);

xlabel('Distance from the wall [mm]', 'FontName','Times','FontSize',fontsize);
ylabel('{\itu}_{\itfl} / {\itS}_{\itL}', 'FontName','Times','FontSize',fontsize);
legend('\fontsize{12}{\itD}_{wall}= 1.5 [mm]','\fontsize{12}{\itD}_{wall}= 2.0 [mm]','\fontsize{12}{\itD}_{wall}= 2.5 [mm]','Location','northwest')
ax=gca;
set(gca, 'FontName','Times','FontSize',fontsize );
set(gca,'LineWidth',1.5,'TickLength',[0.025 0.025]);
ax.YLim = [0 5];
ax.XLim = [0 2.5];
set(gca,'XTickLabel',str2mat('0.0','0.5','1.0','1.5','2.0','2.5'))

print(gcf,'-djpeg', '-r300','fig1.jpeg') 
filename=strcat('C:\Users\knarukawa\Documents\research\Data\Sd_vs_walldistance.png');
saveas(gcf,filename);
close all