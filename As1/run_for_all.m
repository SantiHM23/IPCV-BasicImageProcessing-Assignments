
GT = load('input/gt.mat');
acc_color = 0;
acc_suit  = 0;

for N=1:100
    IMG = imread(['input',filesep,num2str(N),'.jpg']);
    MASK = create_mask(IMG);
    [mass_h, mass_v] = find_center(MASK);
    CROP = apply_mask_and_crop(IMG, MASK, [mass_h, mass_v]);

    color = detect_color(CROP);
    suit  = detect_suit(CROP);
    
    acc_color = acc_color + double(color == GT.color(N));
    acc_suit = acc_suit  + double(suit == GT.suit(N));
    if mod(N,10) == 0
        fprintf('%d %% complete...\n', N);
    end
end


fprintf('Processing finished.\n\nColor label accuracy: %3d %%\n Suit label accuracy: %3d %%\n', acc_color, acc_suit);