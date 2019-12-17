function CROP = apply_mask_and_crop(IMG, MASK, center)
%    IMG: RGB image in uint8 format (from 0 to 255) 
%   MASK: logical array (only zeros and ones).
%          0 if not card,
%          1 if card
% center: 2-element vector, coordinate of the center of mass
%          center(1) is the horizontal coordinate
%          center(2) is the vertical coordinate

    WHT = uint8(ones(size(IMG)) * 255); %White background of the same size of the image
    
    WHT_masked = WHT .* uint8(~MASK);  %Masking of the white background
    IMG_masked = IMG .* uint8(MASK);  %Masking of the original image
    
    Masked = WHT_masked + IMG_masked;  %Original image in white background
    
% CROP: RGB image in uint8 format (from 0 to 255) showing the cropped card
    card_size = [420, 280]; % [height, width] 
    rotcard = rot90(card_size,2); %As cards appear in vertical position in the photo
    
    %Selection of the area of the image of the original matrix in white
    %background in which the card is located, according to the center
    %previously calculated. The area selection goes from the upper left
    %corner to the down right corner, which crresponds to the size of the
    %card
    CROP = imcrop(Masked, [center-(rotcard)/2 rotcard]); %Correcto
    
end