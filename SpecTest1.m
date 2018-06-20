 S = xlsread('C:/Users/chakraborty.s.ab/Documents/lab/SujoyWork/exp/pres/20180618/pressure_10.xlsx','A2:A200001');
 Fs = 20e3;
 nfft = 16384;
 n = length (S);
 %TimeLine = 0:1/Fs:10-(1/Fs);

 PData = 0.5*S;
 
 [pre,ft,pxx,f] = periodogram(PData,hamming(length(PData)),nfft,Fs,'power','reassigned');
 loglog(f,pre,'-sc')
 %loglog(f,pxx,'-s', 'color', [0.3 0.6 0.7])
 xlim([10 1000])