test = load('input/test.mat');

MASK = test.test1_mask;
[x,y] = find_center(MASK);

figure(2);
imshow(MASK); 
hold on;
plot(test.test2_center_x,test.test2_center_y,'r+', 'LineWidth', 1, 'MarkerSize', 15);
plot(x,y,'bx', 'LineWidth', 1, 'MarkerSize', 15);

% Display a warning message if the coordinates are not rounded.
if floor(x)~=x || floor(y)~=y
    rectangle('Position',[480,0,960,100],'FaceColor',[1 1 0])
   
    text(960, 50, 'Warning: Your coordinates are not integers!!!',...
        'HorizontalAlignment','center',...
        'FontSize', 14,...
        'Color', 'r');
end

legend({'Ground truth center of mass', 'Your center of mass'});
