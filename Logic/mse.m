clear all;
clc;

imdata = imread('H:\image\X.png');
figure
imshow(imdata)
title('original image')

ref = rgb2gray(imdata);
figure
imshow(ref)
title('Greyscale image')

N = imnoise(ref, 'salt & pepper',0.02);
figure
imshow(N)
title('Noised image')

g = medfilt1(N);
figure
imshow(g)
title('clear image')

error = immse(N,ref)
error = immse(ref, ref)