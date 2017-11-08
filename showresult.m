%colormap hot
load('../../Output/MeanImage/20170104L_75_on_1_201701_1147mean.mat')
%for n = 1:numArrays
%    FileName = ['../../LIF/BinarizeImage/20170104L_75_on_1_201701_1147' num2str(n,'%03u') '.mat'];
%    BI{n} = load(FileName);
%end
%imagesc(MeanImage(:,:,1))
%colorbar
% for n=1:1
%     FileName = ['../../Output/MeanImage/bmp/20170104L_75_on_1_201701_1147mean' num2str(n,'%02u') '.bmp']; % output file name
%     imwrite(MeanImage(:,:,n),hot(256),FileName);  
% end
for n=1:32
    %imagesc(MeanImage(:,:,n));
    contourf(MeanImage(:,:,n))
    colormap hot
    colorbar
    FileName = ['../../Output/MeanImage/bmp/75on/Phase' num2str(n,'%02u') '.bmp'];
    saveas(gcf,FileName)
end