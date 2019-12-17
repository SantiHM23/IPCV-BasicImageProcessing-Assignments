% Testing enqueue method.
clc; clear;

A = {};
A = fifo_enqueue(A, 5);
if isequal(A, {5})
    disp('Basic test passed!');
else
    warning('Implementation failed on the basic test!');
end

A = {1 2 3};
A = fifo_enqueue(A, 4);
A = fifo_enqueue(A, 5);
A = fifo_enqueue(A, 6);
if isequal(A, {1 2 3 4 5 6})
    disp('Intermediate test passed!');
else
    warning('Implementation failed on the intermediate test!');
end

A = {1, 'cc'};
A = fifo_enqueue(A, magic(4));
if isequal(A, {1, 'cc', magic(4)})
    disp('Advanced test passed!');
else
    warning('Implementation failed on the advanced test!');
end