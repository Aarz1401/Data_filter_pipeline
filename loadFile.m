function processedData = loadFile(filename)
 % Load data from a file

   options = delimitedTextImportOptions('NumVariables', 2);
   % Specify range and delimiter
   options.DataLines = [2, Inf]; % Start reading from the second line due to the header row
   options.Delimiter = ",";
   % Specify variable types as strings
   options.VariableTypes = ["string", "string"];
   % Import the data as a table
   tbl = readtable(filename, options);
   % Convert the table to a string matrix
   stringMatrix = string(table2array(tbl));
    % Initialize the processed data matrix
   nRows = size(stringMatrix, 1);
   processedData = zeros(nRows, 2); % Two columns: first for milliseconds, second for integers
   % Iterate through each row
   for i = 1:nRows
       % Process the first column (time in mm:ss:SSS format)
       timeStr = stringMatrix{i, 1};
       [minutes, remain] = strtok(timeStr, ':');
       [seconds, milliseconds] = strtok(remain, ':');
       milliseconds = strrep(milliseconds, ':', ''); % Remove the colon
       % Convert to milliseconds
       totalMilliseconds = str2double(minutes) * 60000 + ... % Minutes to milliseconds
                           str2double(seconds) * 1000 + ...  % Seconds to milliseconds
                           str2double(milliseconds);         % Milliseconds
       % Store the converted time in the first column
       processedData(i, 1) = totalMilliseconds;
       % Process the second column (cast to integer)
       processedData(i, 2) = str2double(stringMatrix{i, 2});
       
  
   end



end
