% test1, assignment2, 2018

close all;
clear;

R = [   0.744692807074156   0.368484596490336   0.929385970968730;
        0.188955015032545   0.625618560729690   0.775712678608402;
        0.686775433365315   0.780227435151377   0.486791632403172;
        0.183511155737270   0.081125768865785   0.435858588580919];

R1 = [  0.524363223563564   0.630601444826343   0.736839666089121;
        0.557241900368382   0.620738236647080   0.684234572925779;
        0.400606108113012   0.471619585386053   0.542633062659093;
        0.338897162506962   0.372753947476424   0.406610732445885];

R2 = [  0.635655544725233   0.673289678897131   0.710923813069028;
        0.537078298164312   0.577418603094173   0.617758908024033;
        0.438501051603391   0.481547527291215   0.524594002979038;
        0.339923805042470   0.385676451488257   0.431429097934043];

local_mean_img1 = compute_local_mean(R, 1);
d1 = local_mean_img1(:) - R1(:);
d1s = sum(d1);
if d1s>10^-3
    error('Error when calculating local mean image with neighbor radius 1, this difference number should be less than 0.001, but you got %e.\n', d1s);
else
    fprintf('Calculating local mean image with neighbor radius 1 seems OK (error: %e).\n', d1s);
end

local_mean_img2 = compute_local_mean(R, 2);
d2 = local_mean_img2(:) - R2(:);
d2s = sum(d2);
if d2s>10^-3
    error('Error when calculating local mean image with neighbor radius 2, this difference number should be less than 0.001, but you got %e.\n', d2s);
else
    fprintf('Calculating local mean image with neighbor radius 2 seems OK (error: %e).\n', d2s);
end





