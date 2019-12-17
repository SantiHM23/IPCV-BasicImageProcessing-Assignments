function [ filtered_space ] = mean_shift_filtering(feature_space, bandwidth, conv_threshold)

    [m, n] = size(feature_space);  %Size of the input matrix
    filtered_space = zeros(m, n);  %So that the output has the same size as the input
    
    for i = 1:m
        %Every vector on the filtered space is calculated with the
        %find_mode function
        filtered_space(i,:) = find_mode(feature_space, i, bandwidth, conv_threshold);
    end

end