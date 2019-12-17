clear;clc;

i = [0,0,0;2,2,2;0.5,0.5,0.5;1,2,3];

m1 = mean_shift_filtering(i, 0.1, 1e-1);
m2 = mean_shift_filtering(i, 2,   1e-5);
m3 = mean_shift_filtering(i, 4,   1e-2);
g1 = i;
g2 = [1,1,1;6,8,10;1,1,1;6,8,10]/4;
g3 = [0.8803,1.1248,1.3693;0.8811,1.1259,1.3708;0.8805,1.1251,1.3697;0.8812,1.1261,1.3709];

if ~isequal(size(m1),[4,3])
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

disp('Test 4 passed!');