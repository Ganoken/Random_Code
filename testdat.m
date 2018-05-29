clear all

filename = '20170104R_grid.dat';
fid2 = fopen(sprintf(filename),'r');
%%A = load('20170104R_grid.dat');



first_frame=1;
Pixels=1048576;
frames=1;
fseek(fid2,(first_frame-1)*Pixels*2,'bof');
I=zeros(Pixels,frames,'uint16');
for n=1:1:frames
    I(:,n)=(fread(fid2,Pixels,'uint16'));
end
fclose(fid2);
N = [1024 1024 frames];
ImageData.Images.RawImages=permute(reshape(I,N),[2 1 3]);
%ImageData.CameraSetup=CameraSetup;


imshow(ImageData.Images.RawImages(:,:,1),[0 3000]);