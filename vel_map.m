
file='G:/PIV_OUT/still/o-08u_1.dat';
filename=sprintf(file);
%U = % modify using load dat need to be double
fileID=fopen(filename,'r');
U=fread(fileID,'double');
fclose(fileID);
U1=reshape(U,[120,120,2000]);
%imagesc(U1(:,:,1))
U2=U1(:,:,1).';
%imagesc(U2)
%colorbar
%imagesc(U2,[-4,4])
%colormap jet


file='G:/PIV_OUT/still/o-08v_1.dat';
filename=sprintf(file);
fileID=fopen(filename,'r');
V=fread(fileID,'double');
V1=reshape(V,[120,120,2000]);
V2=V1(:,:,1).';
%quiver(U2,V2)

% file='./o-18w_1.dat';
% filename=sprintf(file);
% fileID=fopen(filename,'r');
% W=fread(fileID,'double');
% W1=reshape(V,[120,120,2000]);
%imagesc(W1(:,:,1))
%colormap jet
%hold on
%quiver(U2,V2)
%quiver(U2',V2')
%hold off
%figure
%quiver(flipud(U2'),flipud(V2'))
%figure
%quiver(flipud(U2'),V2')

quiver(rot90(V2(1:105,:),2),rot90(U2(1:105,:),2))
%imagesc(fliplr(U1(:,:,3)'))
imagesc(fliplr(V1(:,1:105,1000)'))