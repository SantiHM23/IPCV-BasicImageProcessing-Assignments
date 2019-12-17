function [out_image] = reshape_spaces(the_space, image_size)

    m = image_size(1);  %Number of rows of the desired output image
    n = image_size(2);  %Number of columns of the desired output image
    [~, b] = size(the_space);  %Columns of the input space (arrays)
    
    if b == 3  %Output should have 3 arrays (RGB image)
        inter_img = reshape(the_space,m,n,b);  %Reshaping so that the arrays are relocated
        pre_image = uint8(inter_img);  %Conversion of the image to a uint8 type
        out_image = ycbcr2rgb(pre_image);  %Conversion from YCbCr color space to RGB color space
    elseif b == 1  %Output should have just 1 array (input is the cluster space)
        inter_img = reshape(the_space,m,n,b);
        pre_image = uint8(inter_img);
        out_image = mat2gray(pre_image);  %Conversion to a grayscale image
    end
    
end