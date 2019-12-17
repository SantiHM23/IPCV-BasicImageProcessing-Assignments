function [ feature_space ] = feature_extractor(image_matrix)

    image_matrix = uint8(image_matrix); %As we have to work with a RGB image

    I_ycbcr = rgb2ycbcr(image_matrix);  %Image transformed to the YCbCr color space
    
    [m, n, ~] = size(I_ycbcr);  %Sizes of the two first dimensions of the image
    N = m*n;  %Number of elements in each array
    
    Array = reshape(I_ycbcr, N, 3);  %Reshaping of the image
    
    feature_space = double(Array);  %Converting the output image into a double image

end