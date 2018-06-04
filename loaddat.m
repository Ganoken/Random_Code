fid=fopen(sprintf('try2_50_pwr.dat'),'r');
%Pixels=1048576;
%I=(fread(fid,Pixels,'uint16'));
I=(fread(fid,'double'));
fclose(fid);
