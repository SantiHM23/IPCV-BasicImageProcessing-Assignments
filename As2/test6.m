% test6, assignment2, 2018.

close all;
clear;

input_img = imread('./input/AndreKertesz_Paris_ManOnBicycle_part.jpg');
input_img = mat2gray(input_img);

iternum = 200;
K = 4/255;
lambda = 0.1; % [0, 0.25]

[output_img_1] = apply_anisotropic_diffusion(input_img, iternum, K, lambda, 1); % g1
[output_img_2] = apply_anisotropic_diffusion(input_img, iternum, K, lambda, 2); % g2

figure(2);
subplot(1, 2, 1);
imshow(input_img);
title('original');
subplot(1, 2, 2);
imshow(output_img_1);
title('after anisotropic diffusion (g1)');

figure(3);
subplot(1, 2, 1);
imshow(input_img);
title('original');
subplot(1, 2, 2);
imshow(output_img_2);
title('after anisotropic diffusion (g2)');



