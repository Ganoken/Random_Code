%tic 
fid2=fopen(sprintf('20170104L_gridoh_201701_1131.mraw'),'r');
Pixels=1048576;
first_frame=1;
frames=100;
fseek(fid2,(first_frame-1)*Pixels*2,'bof');
I=zeros(Pixels,frames,'uint16');
%toc
for n=1:1:frames
    I(:,n)=(fread(fid2,Pixels,'uint16'));
end
fclose(fid2);
N = [1024 1024 frames];
RawImages=permute(reshape(I,N),[2 1 3]);

%S=sum(RawImages,3);
%S/100;
