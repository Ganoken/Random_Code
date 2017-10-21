bpP = filtfilt(dbs,RawPDate);
%Ybp= fft(bpP)
%mbp=abs(Ybp);
bsP = filtfilt(dbs,bpP);
%Ybs= fft(bsP)
%mbs=abs(Ybs);