fid=fopen(sprintf('I:/ch0608/0608/try_120_p14_pwr.dat'),'r');
%Pixels=1048576;
%I=(fread(fid,Pixels,'uint16'));
I=(fread(fid,'double'));
fclose(fid);
