 S = xlsread('C:/Users/chakraborty.s.ab/Documents/lab/SujoyWork/exp/pres/20180618/pressure_02.xlsx','A2:A200001');
 Fs = 20e3;
 nfft = 16384;
 n = length (S);
 %TimeLine = 0:1/Fs:10-(1/Fs);
 ShiftDivision = 4;
 RawPData = 0.5*S;
 r = rem(n,nfft);
 q = fix(n/nfft);


 if  r< nfft/ShiftDivision
     PData = zeros(ShiftDivision*n,1);
    for  j=1 : 4*(q-1)
        PData((j-1)*nfft+1:j*nfft,1) = RawPData((j-1)*(nfft/ShiftDivision)+1:(j-1)*(nfft/ShiftDivision)+nfft,1); 
    end
  
 elseif r < 2*(nfft/ShiftDivision)
      PData = zeros(ShiftDivision*n,1);
    for j=1 : 4*q-3
        PData((j-1)*nfft:j*nfft,1) = RawPData((j-1)*(nfft/ShiftDivision):(j-1)*(nfft/ShiftDivision)+nfft,1); 
    end
    
 elseif r < 3*(nfft/ShiftDivision)
      PData = zeros(ShiftDivision*n,1);
     for j=1 : 4*q-2
        PData((j-1)*nfft:j*nfft,1) = RawPData((j-1)*(nfft/ShiftDivision):(j-1)*(nfft/ShiftDivision)+nfft,1); 
     end
    
 else 
      PData = zeros(ShiftDivision*n,1);
     for j=1 : 4*q-1
        PData((j-1)*nfft:j*nfft,1) = RawPData((j-1)*(nfft/ShiftDivision):(j-1)*(nfft/ShiftDivision)+nfft,1); 
     end
    
 end 
 %[pxx,f] = periodogram(PData,hamming(length(PData)),nfft,Fs,'power');
 [pre,ft,pxx,f] = periodogram(PData,hamming(length(PData)),nfft,Fs,'power','reassigned');
 %loglog(f,pxx,'-sc')
 loglog(f,pre,'-sr')
 %loglog(f,pxx,'-s', 'color', [0.3 0.6 0.7])
 xlim([10 1000])
 
