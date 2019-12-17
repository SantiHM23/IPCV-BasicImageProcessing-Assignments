% Testing offset calculation.
clc; clear;

A = zeros(150,150);
A(30:130, 20:120) = 1;
o = calc_offset(A);
if sum(abs(o-[30,20])) < 5
    disp('Basic test passed!');
else
    warning('Implementation failed on the basic test!');
end

A = zeros(150,150);
A(30:130, 20:120) = 1;
A(30:40, 20:30) = 0;
o = calc_offset(A);
if sum(abs(o-[30,20])) < 5
    disp('Intermediate test passed!');
else
    warning('Implementation failed on the intermediate test!');
end

A = zeros(150,150);
A(30:130, 50:60) = 1;
A(70:80, 20:120) = 1;
o = calc_offset(A);
if sum(abs(o-[30,20])) < 5
    disp('Advanced test passed!');
else
    warning('Implementation failed on the advanced test!');
end