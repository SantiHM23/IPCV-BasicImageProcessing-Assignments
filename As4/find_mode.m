function [ mode ] = find_mode(feature_space, index, bandwidth, conv_threshold)

    x = feature_space(index,:);  %Vector of the given index
    
    [m, ~] = size(feature_space);  %Size of the input matrix
    
    conv = 2 * conv_threshold;  %So that we enter the while
    
    while conv > conv_threshold  %While finishes when convolution is less than the given threshold
        
        feat_vectors = [];  %Empty vector to store the feature vectors
        
        for i = 1:m
            %Calculation of the euclidean distance between the x vector and
            %every vector in the feature space
            eucl_dist = sqrt((x(1)-feature_space(i,1))^2 + (x(2)-feature_space(i,2))^2 + (x(3)-feature_space(i,3))^2);
            
            if eucl_dist < bandwidth
                %If this distance is less than the radius neighbourhood, we
                %store the feature vector
                feat_vectors(end+1,:) = feature_space(i,:);
            end
        end
        
        s1 = 0;  %Help values for sumation
        s2 = 0;
        for j = 1:size(feat_vectors,1)
            %Normalization of difference of vectors
            normaliz = ((x - feat_vectors(j,:))/bandwidth).^2;
            K = kernel_function(normaliz);  %Calculation of the kernel
            s1 = s1 + feat_vectors(j,:) .* K;  %Numerator
            s2 = s2 + K;  %Denominator
        end
        w_mean_vect = s1./s2;  %Calculation of the weighted mean vector
        
        shift_vect = w_mean_vect - x;  %Calculation of the shift vector
        
        x = w_mean_vect;  %Weighted mean vector is the new x vector
        
        conv = norm(shift_vect);  %Calculation of the convolution
        
    end
    
    mode = x;  %Output is the last calculated shift vector

end