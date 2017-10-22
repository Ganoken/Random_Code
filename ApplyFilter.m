%Apply filter to the signal 'RawPData'
%Sujoy created 2017/10

bpP = filtfilt(dbp,RawPDate);
%Ybp= fft(bpP)
%mbp=abs(Ybp);
bsP = filtfilt(dbs,bpP);
%Ybs= fft(bsP)
%mbs=abs(Ybs);