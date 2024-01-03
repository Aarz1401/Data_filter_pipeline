function filteredData = lowPassFilter(rawData, fs)
    %Applies Low Pass filter to data
    fc = 20; % Cut-off frequency
    [b, a] = butter(2,fc / (fs / 2), 'low'); % Design Butterworth filter
    filteredData = filtfilt(b, a, rawData); % Apply the filter
    % Plotting raw vs filtered data
    figure;
    subplot(2,1,1);
    plot(rawData(:,1),rawData(:,2),'-b','DisplayName','OriginalData');
     xlabel('Time (milliseconds)');
    ylabel('GSR Value');
    title('Raw GSR Data');
    subplot(2,1,2);
    plot(filteredData(:,1),filteredData(:,2),'-r','DisplayName','FilteredData');
    xlabel('Time (milliseconds)');
    ylabel('GSR Value');
    title('Filtered GSR Data (Low Pass)');
end


