 S = xlsread('E:/JP7FGD/Documents/Lab/Reasearch/pres/20180618/pressure_10.xlsx','A2:A200001');
 
 Fs = 20e3;
 nfft = 16384;
 PData = 0.5*S;
 
 
 [pxx, f] = pwelch(PData,kaiser(nfft),[],nfft,Fs,'power');
 loglog(f,pxx,'-sk')
 xlim([10 1000])
 
 

