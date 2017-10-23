%Apply filter to the signal 'RawPData'
%Sujoy created 2017/10
function filtered = ApplyFilter (filter,RawData)

filtered = filtfilt(filter,RawData);

end


