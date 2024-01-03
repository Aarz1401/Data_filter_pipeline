function features = CalculateFeatures(data)
    % Calculates GSRFeatures
   
    gsrValues = data(:,2);
    timeValues=data(:,1);
     % Extract GSR values as a numeric array

    % Basic statistical features
    features.F1 = mean(gsrValues);
    features.F2 = var(gsrValues);
    % Find peaks for further analysis
    [peaks, locs] = findpeaks(gsrValues);
    % Initialize SCR features
    amplitudes = [];
    riseTimes = [];

    for i = 1:length(locs)
        peak = locs(i);
        
        % Detect onset: find the point where the signal starts rising towards the peak
        onset = find(diff(gsrValues(1:peak)) < 0, 1, 'last');
        if isempty(onset)
            onset = 1; % Default to start if no rising edge is found
        end

        % Calculate SCR amplitude and rise time
        amplitudes(i) = gsrValues(peak) - gsrValues(onset);
        riseTimes(i) = timeValues(peak) - timeValues(onset);
    end

    % GSR signal features
    features.F3 = sum(riseTimes);
    features.F4 = sum(amplitudes);
    features.F5 = sum(0.5 .* amplitudes .* riseTimes); % GSR peak energy sum
    features.F6 = max(amplitudes); % Amplitude of the highest SCR
    features.F7 = max(riseTimes); % Rise time of the highest SCR
    features.F8 = length(peaks);
    features.F9 = bandpower(gsrValues);

    % Calculate bandwidth of GSR signal
    D_GSR = diff(gsrValues);
    sumDGSR2 = sum(D_GSR.^2);
    sumGSR2 = sum(gsrValues.^2);
    features.F10 = (1/(2*pi)) * sqrt(sumDGSR2 / sumGSR2);
    disp(features);
end