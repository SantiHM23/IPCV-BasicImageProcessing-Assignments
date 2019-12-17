clear;clc;

i = [0,0,0;2,2,2;0.5,0.5,0.5;1,2,3];

m1 = join_regions(i, 0.1);
m2 = join_regions(i, 1);
m3 = join_regions(i, 2);

if ~isequal(size(m1),[4,1])
    error('The size of the returned array is incorrect!');
end

if min(min(m1)) ~= 1
    error('Cluster index should start from 1!');
end

if sum(m1) ~= 1+2+3+4
    error('The returned cluster map is incorrect!');
end
if m2(1) ~= m2(3) || m2(2) == m2(4) || m2(1) == m2(2) || m2(1) == m2(4)
    error('The returned cluster map is incorrect!');
end
if m3(1) ~= m3(3) || m3(2) ~= m3(4) || m3(1) == m3(2) || m3(1) == m3(4)
    error('The returned cluster map is incorrect!');
end


disp('Test 5 passed!');