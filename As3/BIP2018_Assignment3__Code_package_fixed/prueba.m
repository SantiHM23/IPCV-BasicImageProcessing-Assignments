clc;
clear;

im = imread('input/block_1/94.png');
%Imbyn = im2bw(im); %Borrar, solo para jugar con imagen
%I = Imbyn*255;

R = double(im(:,:,1))/255;
        
O = otsu_th(R, 50);
C = crop_and_close(O);

%subplot(1,3,1);
%imshow(im);
%subplot(1,3,2);
%imshow(O);
%subplot(1,3,3);
%imshow(C);

A = [2 3 4 6 1; 5 4 7 6 2; 8 9 9 4 2; 3 1 6 7 8];
s=0;

for i = 1:4
    for j = 1:5
        if A(i,j) < 5
            continue
        else
            b = A(i,j);
            s = s+1;
        end
    end
end

