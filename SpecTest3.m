 clear Pdata

S = xlsread('C:/Users/chakraborty.s.ab/Documents/lab/SujoyWork/exp/pres/20180618/pressure_12.xlsx','A2:A200001');
 
 Fs = 20e3;
 nfft = 16384;
 PData = 0.5*S;
 
 
 [pxx, f] = pwelch(PData,kaiser(nfft,0.5),[],nfft,Fs,'power');
 
 
  % scrsz=get(groot,'ScreenSize');
 %figure('Position', [1 scrsz(2)/3 scrsz(3)/2 scrsz(4)/2]);

 %loglog(f,pxx,'-sc')
 loglog(f,pxx,'-s', 'color', [0.3 0.6 0.7])
 
 %plot3
 
 xlim([10 1000])
 
%  ax = gca;
%     ax.XAxisLocation = 'bottom';
%     ax.YDir='normal';
%     ax.YAxisLocation = 'left';
%     ax.XColor = 'black';
%     ax.YColor = 'black';
%     ax.XScale = 'log';
%     ax.YScale = 'log';
%     %ax.XLim = [30 300];
%    ax.YLim = [10^-9 10^-3];
% %     ax.XTickMode = 'manual';
% %     ax.YTickMode = 'manual';
% %     ax.XTick = 30^0:30^2;
% %     ax.YTick = 10^-11:10^-3;
% %     ax.TickDir = 'in';
% %     ax.TickLength = [0.02 0.035];
% %     ax.XMinorTick = 'on';
% %     ax.YMinorTick = 'on';
% %     ax.XGrid = 'on';
% %     ax.YGrid = 'on';
% %     ax.GridColor = 'yellow';
% %     ax.GridLineStyle = ':';
%     % '-'  ':'  '-.' '--'
%     ax.FontSize = 15;
%     ax.FontName =  'Times New Roman';
%     ax.TitleFontSizeMultiplier = 2;
% 
% %     c.Position = [0.31 0.405 0.01 0.225];
%  
%     xlabel('\it \fontname{Times New Roman}f \rm[Hz]');
%     ylabel('\it \fontname{Times New Roman}Power ');
%  
 %select legend
%  legend('non-exciting','50Hz','60Hz','70Hz','80Hz','90Hz','100Hz','110Hz','Location','Northeast');
%  legend('non-exciting','120Hz','130Hz','140Hz','150Hz','160Hz','170Hz','180Hz','Location','Northeast');

 
