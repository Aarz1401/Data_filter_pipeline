function main()
    % Main function for the program
    baselineData = loadFile('GSR_Baseline.csv');
    baselineFiltered1 = thirdOrderMedianFilter(baselineData);
    sgtitle('Third Order Median Filter for Baseline');
    baselineFiltered2 = lowPassFilter(baselineFiltered1,48); % Sampling frequency
     sgtitle('Low Pass filter for Baseline');
    baselineFiltered3 = movingAverageFilter(baselineFiltered2);
     sgtitle('Moving average Filter for Baseline');
    baselineNormalized = normalizeGSR(baselineFiltered3);
     sgtitle('Normalize GSR for Baseline');
    fprintf('The Features for the Baseline data are :\n');
    baselineFeatures=CalculateFeatures(baselineNormalized);
    baselineFearIndex = calculateFearIndex(baselineFeatures);
    disp('Baseline Fear Index:');
    disp(baselineFearIndex);

    FearData = loadFile('GSR_FEAR.csv');
    FearFiltered1 = thirdOrderMedianFilter(FearData);
     sgtitle('Third Order Median Filter for Fear');
    FearFiltered2 = lowPassFilter(FearFiltered1,48); % Sampling frequency
     sgtitle('Low Pass Filter for Fear');
    FearFiltered3 = movingAverageFilter(FearFiltered2);
     sgtitle('Moving average Filter for Fear');
    FearNormalized = normalizeGSR(FearFiltered3);
    sgtitle('Normalize GSR for Fear');
    fprintf('The Features for the Fear data are :\n');
    FearFeatures=CalculateFeatures(FearNormalized);
    FearFearIndex = calculateFearIndex(FearFeatures);
    disp('Fear Fear Index:');
    disp(FearFearIndex);


    

end

