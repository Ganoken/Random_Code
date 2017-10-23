%Find peaks and make time stamp for phase mean

%initialize and load data
Frequency = 100e3;%kHz
RawPData = csvread('60off.csv');
DataCount = length(RawPData);
MaxT = DataCount/Frequency;
TimeLine = 0:1/Frequency:MaxT-(1/Frequency);
PhaseDivision = 32; % # of 

%Make Filter if needed
frequncylow=[80 149]; % lower side 
frequncyhigh=[220 151]; % higher side
filter1 = generatefilter(0,frequncylow(1),frequncyhigh(1),Frequency); % 0:bandpass, 1:bandstop
filter2 = generatefilter(1,frequncylow(2),frequncyhigh(2),Frequency); 

%Apply filter if needed
FilteredData1 = ApplyFilter (filter1,RawPdata); % pass the filter and data
FilteredData2 = ApplyFilter (filter2,FilteredData1); % increase as many times desired

%Check 
% freq comp
% pwr

%Peak Detection
[Peaks,TimeStamps] = findpeaks(FilteredData2,TimeLine,'MinPeakDistance',0.0045);







