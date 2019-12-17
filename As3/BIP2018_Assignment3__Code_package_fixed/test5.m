% Testing dequeue method.
clc; clear;

A = {1 2 3};
[A, c] = fifo_dequeue(A);
if isequal(A, {2 3}) && c == 1
    disp('Basic test passed!');
else
    warning('Implementation failed on the basic test!');
end

A = {1 2 3};
A = fifo_dequeue(A);
A = fifo_dequeue(A);
[A,c] = fifo_dequeue(A);
if numel(A) == 0 && c == 3
    disp('Intermediate test passed!');
else
    warning('Implementation failed on the intermediate test!');
end

A = {1, 'cc'};
A = fifo_dequeue(A);
A = fifo_dequeue(A);
[A,c] = fifo_dequeue(A);
if numel(c) == 0
    disp('Advanced test passed!');
else
    warning('Implementation failed on the advanced test!');
end