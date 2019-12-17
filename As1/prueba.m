IMG = imread('input/7.jpg');

MASK = create_mask(IMG);
[mass_h, mass_v] = find_center(MASK);
CROP = apply_mask_and_crop(IMG, MASK, [mass_h, mass_v]);

color = detect_color(CROP);
suit  = detect_suit(CROP);

subplot (2,2,1:2); imshow(MASK);
subplot(2,2,3); imshow(CROP); title(t(suit));
subplot(2,2,4); imshow(IMG); title(p(color));

function y = t(x)
    if x == 'R', y='red';   return; end
    if x == 'B', y='black'; return; end
    y = 'undefined';
end

function y = p(x)
    if x == 'H', y='hearts';   return; end
    if x == 'D', y='diamonds'; return; end
    if x == 'S', y='spades';   return; end
    if x == 'C', y='clubs';    return; end    
    y = 'undefined';
end