function [offset] = calc_offset(I)

    [m, n] = size(I);
    
    %1. Create a matrix of zeros which has the same size as the input image.
    ArtfIm = zeros(m,n);
    
    %2. Fill this matrix with ones starting from the location (1,1) to 
    %(100,100). This forms the artificial cheese image.
    ArtfIm(1:100, 1:100) = 1;
    
    %3. Compute the cross-correlation of the input and the artificial image:
    CrossCorr = conv2(I, rot90(conj(ArtfIm), 2));
    
    %4. Crop the result of the cross-correlation. We are only interested in this part:
    Cropped = CrossCorr(m:end, n:end);
    
    %5. Turn this CrossCorr matrix into a vector and find its arg.abs. max:
    [~, arg_max] = max(abs(Cropped(:)));
    
    %6. Translate the found linear index (arg_max) into two offset coordinates:
    [off_y, off_x] = ind2sub(size(Cropped), arg_max);
    
    %7. Return the offset coordinates in a vector:
    offset = [off_y, off_x];

end
