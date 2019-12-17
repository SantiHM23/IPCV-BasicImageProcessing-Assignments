clear;clc;

i = [0,0,0;2,2,2;0.5,0.5,0.5;1,2,3];

m1 = find_mode(i, 4, 0.1, 1e-1);
m2 = find_mode(i, 3, 2,   1e-5);
m3 = find_mode(i, 1, 4,   1e-2);
g1 = [1,2,3];
g2 = [1,1,1]*0.25;
g3 = [0.8803,1.1248,1.3693];

if ~isequal(size(m1),[1,3])
    error('The size of the returned array is incorrect!');
end

if sum(sum(abs(m1-g1))) > 5e-4
    error('The values of the returned array are incorrect!');
end
if sum(sum(abs(m2-g2))) > 5e-4
    error('The values of the returned array are incorrect!');
end
if sum(sum(abs(m3-g3))) > 5e-4
    error('The values of the returned array are incorrect!');
end

if ~isequal(class(m1),'double')
    error('The data type of the returned array is incorrect!');
end

disp('Test 3 passed!');