clear PData
tic 
S = xlsread('C:/Users/chakraborty.s.ab/Documents/lab/SujoyWork/exp/pres/20180618/pressure_02.xlsx','A2:A200001');
 Fs = 20e3;
 nfft = 16384;
 n = length (S);
 %TimeLine = 0:1/Fs:10-(1/Fs);
 ShiftDivision = 2; % limited to 2,4
 RawPData = 0.5*S;
 r = rem(n,nfft);
 q = fix(n/nfft);


 if  r< nfft/ShiftDivision
     PData = zeros(ShiftDivision*n,1);
    for  j=1 : ShiftDivision*(q-1)
        PData((j-1)*nfft+1:j*nfft,1) = RawPData((j-1)*(nfft/ShiftDivision)+1:(j-1)*(nfft/ShiftDivision)+nfft,1); 
    end
  
 elseif r < 2*(nfft/ShiftDivision)
      PData = zeros(ShiftDivision*n,1);
    for j=1 : ShiftDivision*(q-1)+1
        PData((j-1)*nfft+1:j*nfft,1) = RawPData((j-1)*(nfft/ShiftDivision)+1:(j-1)*(nfft/ShiftDivision)+nfft,1); 
    end
    
 elseif r < 3*(nfft/ShiftDivision)
      PData = zeros(ShiftDivision*n,1);
     for j=1 : ShiftDivision*(q-1)+2
        PData((j-1)*nfft+1:j*nfft,1) = RawPData((j-1)*(nfft/ShiftDivision)+1:(j-1)*(nfft/ShiftDivision)+nfft,1); 
     end
    
 else 
      PData = zeros(ShiftDivision*n,1);
     for j=1 : ShiftDivision*(q-1)
        PData((j-1)*nfft+1:j*nfft,1) = RawPData((j-1)*(nfft/ShiftDivision)+1:(j-1)*(nfft/ShiftDivision)+nfft,1); 
     end
    
 end 
 %[pxx,f] = periodogram(PData,hamming(length(PData)),nfft,Fs,'power');
 %[pre,ft,pxx,f] = periodogram(PData,hamming(length(PData)),nfft,Fs,'power','reassigned');
 [pre,ft,pxx,f] = periodogram(PData,kaiser(length(PData)),nfft,Fs,'power','reassigned');
 
 scrsz=get(groot,'ScreenSize');
figure('Position', [1 scrsz(2)/3 scrsz(3)/2 scrsz(4)/2]);

 %loglog(f,pxx,'-sc')
 loglog(f,pre,'-sr')
 %loglog(f,pxx,'-s', 'color', [0.3 0.6 0.7])
 xlim([10 1000])
 
ax = gca;
    ax.XAxisLocation = 'bottom';
    ax.YDir='normal';
    ax.YAxisLocation = 'left';
    ax.XColor = 'black';
    ax.YColor = 'black';
    ax.XScale = 'log';
    ax.YScale = 'log';
    ax.XLim = [30 300];
    ax.YLim = [10^-11 10^-3];
%     ax.XTickMode = 'manual';
%     ax.YTickMode = 'manual';
%     ax.XTick = 30^0:30^2;
%     ax.YTick = 10^-11:10^-3;
%     ax.TickDir = 'in';
%     ax.TickLength = [0.02 0.035];
%     ax.XMinorTick = 'on';
%     ax.YMinorTick = 'on';
%     ax.XGrid = 'on';
%     ax.YGrid = 'on';
%     ax.GridColor = 'yellow';
%     ax.GridLineStyle = ':';
    % '-'  ':'  '-.' '--'
    ax.FontSize = 15;
    ax.FontName =  'Times New Roman';
    ax.TitleFontSizeMultiplier = 2;

%     c.Position = [0.31 0.405 0.01 0.225];
 
    xlabel('\it \fontname{Times New Roman}f \rm[Hz]');
    ylabel('\it \fontname{Times New Roman}Power ');
 
 %select legend
%  legend('non-exciting','50Hz','60Hz','70Hz','80Hz','90Hz','100Hz','110Hz','Location','Northeast');
%  legend('non-exciting','120Hz','130Hz','140Hz','150Hz','160Hz','170Hz','180Hz','Location','Northeast');

toc







