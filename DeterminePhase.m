%Find peaks and make time stamp for phase mean
%Sujoy created 2017/10

%% initialize and load data
Frequency = 100e3;%kHz sampling freq
RawPData = csvread(''); %%Assuming the data is in csv format maybe use input
DataCount = length(RawPData); % Get the # of Data 
MaxT = DataCount/Frequency; % Get the duration of data
TimeLine = 0:1/Frequency:MaxT-(1/Frequency); % Generate the time vactor for the Data
PhaseDivision = 32; % # of phase 

%% Make Filter if needed
frequncylow=[80 149]; % lower side for multiple filter increase the element
frequncyhigh=[220 151]; % higher side
filter1 = generatefilter(0,frequncylow(1),frequncyhigh(1),Frequency); % 0:bandpass, 1:bandstop
filter2 = generatefilter(1,frequncylow(2),frequncyhigh(2),Frequency); 

%% Apply filter if needed
FilteredData1 = ApplyFilter (filter1,RawPData); % pass the filter and data
FilteredData2 = ApplyFilter (filter2,FilteredData1); % increase as many times desired

%% Check whether desired filtered signal is otained
% freq comp
% pwr

%% Peak Detection
[Peaks,TimeStamps] = findpeaks(FilteredData2,TimeLine,'MinPeakDistance',0.0045);
%Take the desired length

%% Elemenate initial large peaks if needed
%It will be later modified to use statistical treatment
%Currently manual picking of value
%% caution temporary 
%TimeDuration = 2 + TimeStamps(1,15);
%TimeUse = TimeStamps(TimeStamps < TimeDuration); % need two sec
%CleanedTimeStamps = TimeUse(15:end);% manually selected

CleanedTimeStamps = TimeStamps(15:end); %Temp later 15 is valid for specific data
ShiftedTime = CleanedTimeStamps -TimeStamps(1,15);
TimeUse = ShiftedTime(1:1+nnz(ShiftedTime < 2)); % Need 2 sec in this case 


%% generate the time vector for phase mean

%TotalPhasePoint = length(CleanedTimeStamps)*PhaseDivision;
s=1;

PhaseTimeStamps =zeros((length(TimeUse)-1)*PhaseDivision,1);
for j =1:PhaseDivision:((length(TimeUse)-1)*PhaseDivision)
    PhaseTimeStamps(j) = TimeUse(1,s);
    PhaseDuration = (TimeUse(1,s+1)-TimeUse(1,s))/PhaseDivision;
    for k = 1:PhaseDivision-1
        PhaseTimeStamps(j+k) = PhaseTimeStamps(j+k-1)+PhaseDuration;
        if PhaseTimeStamps(j+k) >= 2
            break
        end
    end    
    s = s+1;
end


%other implementation
% s=1;
% 
% PhaseTimeStamps =zeros(length(TimeUse)*PhaseDivision,1);
% for j =1:PhaseDivision:((length(TimeUse)-1)*PhaseDivision)
%     PhaseTimeStamps(j) = TimeUse(1,s);
%     PhaseDuration = (TimeUse(1,s+1)-TimeUse(1,s))/PhaseDivision;
%     for k = 1:PhaseDivision
%         PhaseTimeStamps(j+k) = PhaseTimeStamps(j)+k*PhaseDuration;
%         if j+k+1>length(TimeUse)*PhaseDivision 
%            break
%        end
%         
%     end    
%     s = s+1;
% end
