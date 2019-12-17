% Process 5 batches of cheese data
clear; clc; close all;

total_err = zeros(1,5);

for block = 1:5
    gt = load(['input/block_',num2str(block),'/gt.mat']);
    disp(['Loading block #',num2str(block),'                  Be patient!']);
    
    CHEESE = zeros(100,100,100);
    for layer = 1:100
        I = imread(['input/block_',num2str(block),'/',num2str(layer),'.png']);
        R = double(I(:,:,1))/255;
        
        O = otsu_th(R, 50);
        C = crop_and_close(O);
        CHEESE(:,:,layer) = ~C;
    end
    disp('   Done!');
    
    %close all; figure(1);
    plot_cube(CHEESE);

    disp(['Processing the cheese block #',num2str(block),'   Be patient!']);
    result = process_the_block_of_cheese(CHEESE);
    disp('   Done!');
    
    disp(['Results on block #',num2str(block)]);
    
    A = sort(gt.gt,'descend');
    B = sort(result,'descend');
    
    if numel(A) < numel(B)
        A(end+1:numel(B)) = 0;
    elseif numel(A) > numel(B)
        B(end+1:numel(A)) = 0;
    end
    
    abs_diff = sum(abs(A-B));
    the_err = abs_diff / sum(gt.gt(:));
    total_err(block) = the_err;
    disp(['    Holes found:  ',num2str(numel(result)), ' / ', num2str(numel(gt.gt)) ]);
    disp(['   The error is:  ',num2str(abs_diff), ' voxels (',num2str(the_err),'%)']);
    
end
