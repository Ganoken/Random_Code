
Fs = 100e3;
RawPData = csvread('60off.csv');
n = length (RawPData);
TimeLine = 0:1/Fs:10-(1/Fs);
Y = fft(RawPData);
f = (0:n-1)*(Fs/n);
power = abs(Y).^2/n;
%magnitudeY = abs(Y);
phaseY = unwrap(angle(Y));
%[pbutt,fbutt] = periodogram(buttLoop,[],[],Fs);
%plot(fbutt,20*log10(abs(pbutt)),'--')
