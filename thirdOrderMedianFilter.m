function filteredData = thirdOrderMedianFilter(data)
    % Applies third order median filter to data
   rawData=data;
   [n_Rows, ~] = size(data);
   % Initialize filteredDataColumn with the same size as the second column of data
   filteredDataCol = zeros(n_Rows, 1); % Ensuring the column vector format
   % Extract the second column as an array
   if istable(data)
       dataColumn = data{:,2};
   else
       % Assuming data is a matrix
       dataColumn = data(:,2);
   end
   % Apply median filter for the second column
   for row = 2:(n_Rows - 1) % Exclude first and last element
       % Extract the neighborhood values
       neighbors = dataColumn(row-1:row+1);
      
       % Compute median and assign to filtered data column
       filteredDataCol(row) = median(neighbors);
   end
   % Keep the first and last elements unfiltered
   filteredDataCol(1) = dataColumn(1);
   filteredDataCol(end) = dataColumn(end);
   % Replace the second column of the original data with the filtered data
   if istable(data)
       data{:,2} = filteredDataCol;
   else
       data(:,2) = filteredDataCol;
   end
   filteredData = data;

    % Plotting
    figure; % Create a new figure
    subplot(2,1,1);
    plot(rawData(:,1),rawData(:,2),'-b','DisplayName','OriginalData');
     xlabel('Time (milliseconds)');
    ylabel('GSR Value');
    title('Raw GSR Data');
    subplot(2,1,2);
    plot(filteredData(:,1),filteredData(:,2),'-r','DisplayName','FilteredData');
    xlabel('Time (milliseconds)');
    ylabel('GSR Value');
    title('Third Order Filtered GSR data');


end

