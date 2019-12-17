clear; clc; close all;

ii = imread('input/berry_resized.jpg');
fprintf('Running the segmentation algorithm. Be patient!\n');
tic;
ff = feature_extractor(ii);
ss = mean_shift_filtering(ff, 15, 1e-2);
cc = join_regions(ss, 100);

aa = reshape_spaces(ss, size(ii));
bb = reshape_spaces(cc, size(ii));
tt = toc;
fprintf('Segmentation finished in %f seconds.\n', tt);

figure(1);
subplot(131); imshow(ii); title('Original image');
subplot(132); imshow(aa); title('Filtered image');
subplot(133); imshow(bb); title('Segmented image');
    