%do not run just a memo
S = xlsread('C:/Users/chakraborty.s.ab/Documents/lab/SujoyWork/exp/pres/20180618/pressure_11.xlsx','A2:A200001');

Frequency = 20e3;
DataCount = length(S);
MaxT = DataCount/Frequency;
TimeLine = 0:1/Frequency:MaxT-(1/Frequency);

% frequncylow=[10]; % lower side for multiple filter increase the element
% frequncyhigh=[1000]; % higher side
% filter1 = generatefilter(0,frequncylow(1),frequncyhigh(1),Frequency); % 0:bandpass, 1:bandstop
% FilteredData1 = ApplyFilter (filter1,S); 

windowSize = 20; 
b = (1/windowSize)*ones(1,windowSize);
a = 1;
y = filter(b,a,S);

lpFilt = designfilt('lowpassiir','FilterOrder',8, ...
         'PassbandFrequency',1e3,'PassbandRipple',0.2, ...
         'SampleRate',20e3);
     
[Peaks,TimeStamps] = findpeaks(S,TimeLine,'MinPeakDistance',0.01);


windowSize = 10; 
b = (1/windowSize)*ones(1,windowSize);
a = 1;
y2 = filter(b,a,S);

y3 = filtfilt(b,a,S);

lpFilt2 = designfilt('lowpassfir','FilterOrder',4, ...
         'PassbandFrequency',1e3, ...
         'SampleRate',20e3);
     
grpdelay(lpFilt,2048,Frequency)

y4 = filter(lpFilt,S);

[Peaks2,TimeStamps2] = findpeaks(y3,TimeLine,'MinPeakDistance',0.01);

