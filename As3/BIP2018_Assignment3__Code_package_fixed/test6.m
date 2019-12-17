% test processor function
clc; clear;

cube = zeros(10,10,10);
cube(2:3,4:5, 2:4) = 1;
cube(8:9,  7, 5:8) = 1;

sum_holes = sum(cube(:));
holes = [12 8];

reslt = process_the_block_of_cheese(cube);

if isequal(sort(holes), sort(reslt))
    disp('The cheese block processor seems to be OK!');
else
    warning('Something went wrong...');
end