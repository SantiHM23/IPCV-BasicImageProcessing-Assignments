function [local_mean_img] = compute_local_mean(in_img, r)
    
    local_mean_img = in_img;  %So that the output image has the same size as the input image
    
    inter_img = padarray(in_img, [r r] , 'replicate');  %Image with its boundaries replicated in an r radius
    
    [m, n] = size(local_mean_img);  %Size of the output (or input) image
    
    N = abs(4*r+4*r*r+1);  %Number of pixels of the local neighbourhood of every pixel
    
    for x = 1:m
        for y = 1:n
            temp = 0;  %Help parameter to store the sumatory
            for i = -r:r
                for j = -r:r
                    a = x+r+i;  %X-position of the pixel + radius of neighbourhood + position of i, which runs all rows in the local neighbourhood
                    b = y+r+j;  %Y-position of the pixel + radius of neighbourhood + position of j, which runs all columns in the local neighbourhood
                    %Applying the local means formula
                    temp = temp + inter_img(a,b);  %Storing of the sumatory of the local neighbourhood of the x,y pixel
                end
            end
            local_mean_img(x,y) = (1/N)* temp;  %Formula of the new value of the x,y pixel in the output image
        end
    end
    
end