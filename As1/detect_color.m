function color = detect_color(CARD)
% CARD: RGB image of the card (uint8 type)

    R = CARD(:,:,1);  %Red panel of the cropped image
  
% color: char type, possible values:
%         'R' for red
%         'B' for black
    thres = R>150; %Threshold that practically erases the symbols of the red cards
                   %and keeps on image the symbols of the black cards
    
    SUM = sum(sum(thres)); %Sum of the pixels of the thresholded cards
    
    %With that threshold, black cards obtain a SUM value around 105000, and red cards obtain a
    %SUM value around 116000. This allows to differenciate both colors
    if SUM>110000
        color = 'R';
    end
    if SUM<110000
        color = 'B';
    end
end