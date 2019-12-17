function [local_contrast_img] = compute_local_contrast(in_img, local_mean_img, r)
    
    local_contrast_img = in_img;  %So that the output image has the same size as the input one
    
    inter_inp_img = padarray(in_img, [r r] , 'replicate');  %Input image with its boundaries replicated in an r radius
    inter_mean_img = padarray(local_mean_img, [r r] , 'replicate');  %Local mean image with its boundaries replicated in an r radius
    
    [m, n] = size(local_contrast_img);  %Size of the output image
    
    N = abs(4*r+4*r*r+1);  %Number of pixels of the local neighbourhood of every pixel
    
    for x = 1:m
        for y = 1:n
            temp = 0;  %Help parameter to store the sumatory
            for i = -r:r
                for j = -r:r
                    a = x+r+i;  %X-position of the pixel + radius of neighbourhood + position of i, which runs all rows in the local neighbourhood
                    b = y+r+j;  %Y-position of the pixel + radius of neighbourhood + position of j, which runs all columns in the local neighbourhood
                    %Applying the local contrast formula
                    temp = temp + (inter_inp_img(a,b) - inter_mean_img(a,b))^2;  %Storing of the sumatory of the local neighbourhood of the x,y pixel
                end
            end
            local_contrast_img(x,y) = (1/N)* sqrt(temp);  %Formula of the new value of the x,y pixel in the output image
        end
    end

end