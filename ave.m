

nx=1024;
nz=10;

cam='r';



file='spiv_%s_grid.mraw';
filename=sprintf(file,cam);
fileID=fopen(filename,'r');
V=reshape(fread(fileID,'uint16'),[nx,nx,nz]);
fclose(fileID);

Vm=mean(V,3);

file='%sm_grid.dat';
filename=sprintf(file,cam);
fileID=fopen(filename,'w');
fwrite(fileID,reshape(uint16(Vm),[nx*nx,1]),'uint16');
fclose(fileID);


