test = load('input/test.mat');

c_hearts = detect_suit(test.test4_hearts);
c_diamonds = detect_suit(test.test4_diamonds);
c_spades = detect_suit(test.test4_spades);
c_clubs = detect_suit(test.test4_clubs);

figure(5);
subplot(141); imshow(test.test4_hearts); title(t(c_hearts));
subplot(142); imshow(test.test4_diamonds); title(t(c_diamonds));
subplot(143); imshow(test.test4_spades); title(t(c_spades));
subplot(144); imshow(test.test4_clubs); title(t(c_clubs));


function y = t(x)
    if x == 'H', y='hearts';   return; end
    if x == 'D', y='diamonds'; return; end
    if x == 'S', y='spades';   return; end
    if x == 'C', y='clubs';    return; end    
    y = 'undefined';
end
    
        