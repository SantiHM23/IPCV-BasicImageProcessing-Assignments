test = load('input/test.mat');

c_hearts = detect_color(test.test4_hearts);
c_diamonds = detect_color(test.test4_diamonds);
c_spades = detect_color(test.test4_spades);
c_clubs = detect_color(test.test4_clubs);

figure(4);
subplot(141); imshow(test.test4_hearts); title(t(c_hearts));
subplot(142); imshow(test.test4_diamonds); title(t(c_diamonds));
subplot(143); imshow(test.test4_spades); title(t(c_spades));
subplot(144); imshow(test.test4_clubs); title(t(c_clubs));


function y = t(x)
    if x == 'R', y='red';   return; end
    if x == 'B', y='black'; return; end
    y = 'undefined';
end
    
        