function [processed_img] = apply_wallis_operator(in_img, local_mean_img, desired_mean, local_contrast_img, desired_contrast, A_max, p)

    processed_img = in_img;  %So that the output image has the same size as the input one
    
    [m, n] = size(processed_img);  %Size of the output (or input) image
    
    for x = 1:m
        for y = 1:n
            %Wallis operator formula for each pixel
            processed_img(x,y) = (in_img(x,y) - local_mean_img(x,y)) * ((A_max * desired_contrast)/(A_max * local_contrast_img(x,y) + desired_contrast)) + (p * desired_mean + (1-p) * local_mean_img(x,y));
        end
    end

end