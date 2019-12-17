function [E] = crop_and_close(I)

    %1. Compute the offset vector using your previously implemented function.
    offset = calc_offset(I);
    off_y = offset(1);
    off_x = offset(2);
    
    %2. Crop a 100×100 size region from the input image starting from the location
    %given by the offset coordinates. The slice should fit into this 100×100 matrix.
    Crop = I(off_y:(off_y+99), off_x:(off_x+99));
    
    %3. Create a ‘disk’ type structuring element with radius 1.
    Str_El = strel('disk',1);
    
    %4. First dilate then erode the cropped image.
    E_dil = imdilate(Crop,Str_El);
    E = imerode(E_dil,Str_El);  %Image after the closing (dilation+erosion)

end
