clear;clc;

i = [0,0,0;2,2,2;0.5,0.5,0.5;1,2,3];

k = kernel_function(i);
g = [0.5000,0.5000,0.5000;0.1839,0.1839,0.1839;0.3894,0.3894,0.3894;0.3033,0.1839,0.1116];

if ~isequal(size(k),[4 3])
    error('The size of the returned array is incorrect!');
end

if sum(sum(abs(k-g))) > 5e-4
    error('The values of the returned array are incorrect!');
end

if ~isequal(class(k),'double')
    error('The data type of the returned array is incorrect!');
end

disp('Test 2 passed!');