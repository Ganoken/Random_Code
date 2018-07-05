%
%S = xlsread('C:/Users/chakraborty.s.ab/Documents/lab/SujoyWork/exp/pres/20180618/pressure_12.xlsx','A2:A200001');
S = xlsread('I:/pres/20180618/pressure_19.xlsx','A2:A200001');

Frequency = 20e3;
DataCount = length(S);
MaxT = DataCount/Frequency;
TimeLine = 0:1/Frequency:MaxT-(1/Frequency);

PData = 0.5*S(1:40000);
TimeLineS = TimeLine(1:40000);
windowSize = 20; 
b = (1/windowSize)*ones(1,windowSize);
a = 1;
filtered = filtfilt(b,a,PData);
filtered2 = filtfilt(b,a,0.5*S);
%[Peaks,TimeStamps] = findpeaks(filtered,TimeLine,'MinPeakDistance',0.01);

 %Fs = 20e3;
 %nfft = 16384;
 %[pxx, f] = pwelch(PData,kaiser(nfft,0.5),[],nfft,Fs,'power');
 %[pxxf, ff] = pwelch(filtered,kaiser(nfft,0.5),[],nfft,Fs,'power');
 
 %z=zeros(1,8193);
 %z=z-0.4;
 %plot3(ff,pxxf,z,'-k')
 %plot3(ff,pxxf,z,'-','color', [1 0.5 0])
 
  scrsz=get(groot,'ScreenSize');
 figure('Position', [1 scrsz(2)/3 scrsz(3)/2 scrsz(4)/2]);
 %plot(TimeLineS,PData,'-c');
 %plot(TimeLineS,PData,'-', 'color', [1 0.5 0]);
 plot(TimeLine,filtered2,'-r');
  %plot(TimeLine,filtered2,'-', 'color', [0.6 0.6 0.5]);
  ax = gca;
     ax.XAxisLocation = 'bottom';
     ax.YDir='normal';
     ax.YAxisLocation = 'left';
     ax.XColor = 'black';
     ax.YColor = 'black';
 %    ax.XScale = 'log';
 %    ax.YScale = 'log';
   %  ax.XLim = [0 0.2];
     ax.XLim = [0 10];
    % ax.XLim = [30 300];
  %  ax.YLim = [10^-9 10^-2];
  ax.YLim = [-0.06 0.06];
     %ax.XTickMode = 'manual';
     ax.YTickMode = 'manual';
     xtickformat('%.2f')
     ytickformat('%.2f')
     %ax.XTick = 0:0.05:0.20;
     ax.YTick = -0.06:0.02:0.06;
  %   ax.TickDir = 'in';
% %     ax.TickLength = [0.02 0.035];
% %     ax.XMinorTick = 'on';
% %     ax.YMinorTick = 'on';
% %     ax.XGrid = 'on';
% %     ax.YGrid = 'on';
% %     ax.GridColor = 'yellow';
% %     ax.GridLineStyle = ':';
%     % '-'  ':'  '-.' '--'
     ax.FontSize = 24;
     ax.FontName =  'Times New Roman';
     ax.TitleFontSizeMultiplier = 2;
% 
% %     c.Position = [0.31 0.405 0.01 0.225];
%  
     xlabel('\it \fontname{Times New Roman}t \rm[sec]');
     ylabel('\it \fontname{Times New Roman}p` \rm[kPa] ');
%  
 %select legend
%  legend('off','50Hz','60Hz','70Hz','80Hz','90Hz','100Hz','110Hz','120Hz','Location','Northeast');
%  legend('non-exciting','120Hz','130Hz','140Hz','150Hz','160Hz','170Hz','180Hz','Location','Northeast');