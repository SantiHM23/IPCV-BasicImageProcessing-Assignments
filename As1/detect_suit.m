function suit = detect_suit(CARD)
% CARD: RGB image of the card (uint8 type)

    G = CARD(:,:,2); %Green panel of the input image
    
% cuit: char type, possible values:
%         'C' for clubs (♣)
%         'D' for diamonds (♦)
%         'H' for hearts (♥)
%         'S' for spades (♠)

    suits = load('input/suits.mat'); %Load of convolution kernel matrices
    
    thres = G>180; %Threshold value that keeps good differenciation between
                   %the card's shape and its interior symbols (card white,
                   %symbols and table black)
    
    Masked = double(~thres); %The masked image is the negative of the masked card
    
    spade = conv2(Masked, suits.spades); %Convolution with the spades kernel matrix
    heart = conv2(Masked, suits.hearts); %Convolution with the hearts kernel matrix
    diamond = conv2(Masked, suits.diamonds); %Convolution with the diamonds kernel matrix
    club = conv2(Masked, suits.clubs); %Convolution with the clubs kernel matrix
    
   %Search for the maximum valued pixel in the result matrix of each
   %convolution. The maximum value pixel corresponds to the most probable
   %answer for the suit classification
    max_s = max(max(spade)); 
    max_h = max(max(heart));
    max_d = max(max(diamond));
    max_c = max(max(club));
    
    %Call to detect the color for easier classification
    color = detect_color(CARD);
    
    %When detected color is black, only spades and clubs are possible
    %answers
    if color == 'B'
        if max_s>max_c
            suit = 'S';
        end

        if max_c>max_s
            suit = 'C';
        end
    end

    %When detected color is red, only hearts and diamonds are possible
    %answers
    if color == 'R'
        if max_h>max_d
            suit = 'H';
        end

        if max_d>max_h
            suit = 'D';
        end
    end
    
end