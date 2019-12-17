test = load('input/test.mat');

IMG = imread('input/28.jpg');
MASK = create_mask(IMG);
GT = test.test1_mask;

% test: what is the type of the returned thing?
if ~isequal(class(MASK), 'logical')
    error(['The function outputs a ',class(MASK), ' type instead of a logical image!']);
end


figure(1);
subplot(3,2,1:2); imshow(IMG); title('Input');
subplot(3,2,3); imshow(MASK); title('Your mask');
subplot(3,2,4); imshow(GT); title('Ground truth mask');
subplot(3,2,5:6); imshow(abs(GT-MASK)); title({'Difference between masks', ...
    ['err = ', num2str(sum(sum(abs(GT-MASK)))/numel(MASK)), ' %']});