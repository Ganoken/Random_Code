%Find peaks and make time stamp for phase mean
%Sujoy created 2017/10

%initialize and load data
Frequency = 100e3;%kHz
RawPData = csvread(''); %Assuming the data is in csv format
DataCount = length(RawPData); % Get the # of Data 
MaxT = DataCount/Frequency; % Get the duration of data
TimeLine = 0:1/Frequency:MaxT-(1/Frequency); % Generate the time vactor for the Data
PhaseDivision = 32; % # of phase 

%Make Filter if needed
frequncylow=[80 149]; % lower side for multiple filter increase the element
frequncyhigh=[220 151]; % higher side
filter1 = generatefilter(0,frequncylow(1),frequncyhigh(1),Frequency); % 0:bandpass, 1:bandstop
filter2 = generatefilter(1,frequncylow(2),frequncyhigh(2),Frequency); 

%Apply filter if needed
FilteredData1 = ApplyFilter (filter1,RawPdata); % pass the filter and data
FilteredData2 = ApplyFilter (filter2,FilteredData1); % increase as many times desired

%Check whether desired filtered signal is otained
% freq comp
% pwr

%Peak Detection
[Peaks,TimeStamps] = findpeaks(FilteredData2,TimeLine,'MinPeakDistance',0.0045);

%Elemenate initial large peaks if needed





