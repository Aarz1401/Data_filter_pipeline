function FI = calculateFearIndex(features)
    % This Function calculates the Fear index according to the given
    % formula
    FI = features.F1 + 2 * features.F2 + features.F3 + ...
                0.5 * features.F4 + features.F5 + 2 * features.F6 + ...
                features.F7 + 5 * features.F8 + 0.001 * features.F9 + ...
                0.5 * features.F10;
end
