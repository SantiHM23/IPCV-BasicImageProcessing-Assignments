function MASK = create_mask(IMG)
%  IMG: RGB image in uint8 format (from 0 to 255)

    R = IMG(:,:,1);  %Red panel of the image
    G = IMG(:,:,2);  %Green panel of the image
    B = IMG(:,:,3);  %Blue panel of the image
    
% MASK: logical array (only zeros and ones).
%        0 if not card,
%        1 if card

    MASK = R>25 & G>30;  %Threshold values for low error
end