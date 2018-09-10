clear;
close all;
clc;

%cd E:\kyabuta\temp\3comp\image\
%cd /work1/t2gmt-combust/kyabuta/analysis/image/
%for NN=60
%parfor N=5:21
%    NN=N*10;
directoryname='Output/MeanImage/jpg/60off/';
%imageNames = dir(fullfile('/work1/t2gmt-combust/kyabuta/',directoryname,'*.jpg'));
imageNames = dir(fullfile(directoryname,'*.jpg'));
imageNames = {imageNames.name}';
outputVideo = VideoWriter(fullfile('./',directoryname,'vec2.avi'));
outputVideo.FrameRate = 5;
open(outputVideo);



for j = 1:32
   img = imread(fullfile('./',directoryname,imageNames{j}));
%   disp(img);
   writeVideo(outputVideo,img);
end

close(outputVideo);
%end