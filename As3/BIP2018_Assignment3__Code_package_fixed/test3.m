% Testing cropping & closing.
clc; clear;

A = zeros(150,150);
A(30:130, 20:120) = 1;
B = crop_and_close(A);
if abs(sum(B(:))-10000) < 5
    disp('Basic test passed!');
else
    warning('Implementation failed on the basic test!');
end

A = zeros(150,150);
A(30:130, 20:120) = 1;
A = imnoise(A, 'salt & pepper');
B = crop_and_close(A);
if abs(sum(B(:))-10000) < 5
    disp('Intermediate test passed!');
else
    warning('Implementation failed on the intermediate test!');
end

A = zeros(150,150);
A(30:130, 50:60) = 1;
A(70:80, 20:120) = 1;
B = crop_and_close(A);
if abs(sum(B(:))-2083) < 5
    disp('Advanced test passed!');
else
    warning('Implementation failed on the advanced test!');
end