clear;clc;

i(:,:,1) = [  0   0 127;   2   2   2];
i(:,:,2) = [ 64 128 196; 255 255 255];
i(:,:,3) = [ 33  66  99; 128 128 128];

f = feature_extractor(i);
g = [51,124,102;158,110,26;87,120,76;158,110,26;157,96,105;158,110,26];

if ~isequal(size(f),[6 3])
    error('The size of the feature space is incorrect!');
end

if ~isequal(f,g)
    error('The values of the feature space are incorrect!');
end

if ~isequal(class(f),'double')
    error('The data type of the feature space is incorrect!');
end

disp('Test 1 passed!');