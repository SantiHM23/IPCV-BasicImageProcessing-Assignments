test = load('input/test.mat');

IMG = imread('input/28.jpg');
MASK = test.test1_mask;
center = [test.test2_center_x, test.test2_center_y];

% test: can you deal with a card that is partially outside of the image?
Q = apply_mask_and_crop(IMG, MASK, [1 1]);

% test: what is the type of the returned thing?
if ~isequal(class(Q), 'uint8')
    error(['The function outputs a ',class(Q), ' type instead of an uint8 image!']);
end

% test: is the visual output correct?
crop = apply_mask_and_crop(IMG, MASK, [test.test2_center_x, test.test2_center_y]);
figure(3);
subplot(121); imshow(crop); title('Your output');
subplot(122); imshow(test.test3_crop); title('Required output');
