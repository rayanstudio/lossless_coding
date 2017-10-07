function out = myEntropy(X)
    if isstring(X) == true
       X = uint8(X);
    end
    values = unique(X);      % Gathers all unique values
    M = sum(values);         % calculates total for weights
    out = (values(1:length(values))/M)*100; % probability equation
    if isnumeric(X) == true
        histogram(X);   % plots histogram
        title('Histogram of Lena, Grayscale');
        xlabel('Normalized inputs'); ylabel('Frequency');
    end
end
