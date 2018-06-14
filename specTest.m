%Spectral Analysis

Fs = 20e3;
RawPData = csvread('60off.csv');
n = length (RawPData);
TimeLine = 0:1/Fs:10-(1/Fs);
<<<<<<< HEAD
Y = fft(RawPData*0.5);
=======
PData = 0.5*RawPData;
Y = fft(RawPData);
>>>>>>> 2dc3b37e1b2f196d501fe2b43e24eaa4d4fae99f
f = (0:n-1)*(Fs/n);
power = abs(Y).^2/n;
%magnitudeY = abs(Y);
phaseY = unwrap(angle(Y));
%[pbutt,fbutt] = periodogram(buttLoop,[],[],Fs);
%plot(fbutt,20*log10(abs(pbutt)),'--')

%bpP = filtfilt(dbp,RawPData);
%Ybp= fft(bpP);
%mbp=abs(Ybp);
%bsP = filtfilt(dbs,bpP);
%Ybs= fft(bsP);
%mbs=abs(Ybs);