function normalizedData = normalizeGSR(rawData)
     % Normalizes GSR value of data between 0 and 100
    minGSR = min(rawData(:, 2));
    maxGSR = max(rawData(:, 2));

    % Normalize the GSR values manually to [0, 100]
    normalizedValues = 100 * (rawData(:, 2) - minGSR) / (maxGSR - minGSR);

    % Create the normalizedData matrix with time and normalized values
    normalizedData = [rawData(:, 1), normalizedValues];
     % Plotting input 
    figure;
    subplot(2,1,1);
    plot(rawData(:,1),rawData(:,2),'-b','DisplayName','OriginalData');
     xlabel('Time (milliseconds)');
    ylabel('GSR Value');
    title('Raw GSR Data');
    subplot(2,1,2);
    plot(normalizedData(:,1),normalizedData(:,2),'-r','DisplayName','FilteredData');
    xlabel('Time (milliseconds)');
    ylabel('GSR Value');
    title('Normalized GSR data');
    
end
