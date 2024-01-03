function filteredData = movingAverageFilter(rawData)
    % Applies 10 point moving average filter to data
    windowSize = 10; % N-point moving average

    % Manual moving average calculation
    filteredValues = zeros(size(rawData, 1) - windowSize + 1, 1);
    for i = 1:size(filteredValues, 1)
        filteredValues(i) = mean(rawData(i:i+windowSize-1, 2));
    end

    % Create the filteredData matrix with time and filtered values
    filteredData = [rawData(1:end-windowSize+1, 1), filteredValues];

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
    title('Filtered GSR Data (Moving Average)');
end

