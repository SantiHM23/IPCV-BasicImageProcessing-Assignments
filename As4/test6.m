clear;clc;

i(:,:,1) = [  0   0 127;   2   2   2];
i(:,:,2) = [ 64 128 196; 255 255 255];
i(:,:,3) = [ 33  66  99; 128 128 128];
i = uint8(i);

g = [51,124,102;158,110,26;87,120,76;158,110,26;157,96,105;158,110,26];

r = reshape_spaces(g, size(i));

if ~isequal(size(r),[2,3,3])
    error('The size of the returned array is incorrect!');
end

if ~isequal(class(r), 'uint8')
    error('The data type of the returned 2D RGB image is incorrect!!');
end

if sum(sum(sum(abs(i-r)))) > 10
    error('The values in the returned 2D RGB image are incorrect!');
end



disp('Test 6 passed!');