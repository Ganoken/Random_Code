 S = xlsread('G:/pres/20180608/pressure_14.xlsx','A2:A200001');
 Fs = 20e3;
 n = length (S);
 TimeLine = 0:1/Fs:10-(1/Fs);
 PData = 0.5*S;
 [pxx,f] = periodogram(S,hamming(length(S)),32768,Fs,'power');
 loglog(f,pxx,'-sr')
 %loglog(f,pxx,'-s', 'color', [0.3 0.6 0.7])
 xlim([10 1000])