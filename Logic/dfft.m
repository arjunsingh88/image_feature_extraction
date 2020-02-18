clear all; 
close all; 
clc
imdata = imread('H:\image\X.png');
figure(1);imshow(imdata); title('Original Image');
imdata = rgb2gray(imdata);
figure(2); imshow(imdata); title('Gray Image');
%Get Fourier Transform of an image
F = fft2(imdata);
% Fourier transform of an image
S = abs(F);
figure(3);imshow(S,[]);title('Fourier transform of an image');
%get the centered spectrum
Fsh = fftshift(F);
figure(4);imshow(abs(Fsh),[]);title('Centered fourier transform of Image')
%apply log transform
S2 = log(1+abs(Fsh));
figure(5);imshow(S2,[]);title('log transformed Image')
%reconstruct the Image
F = ifftshift(Fsh);
f = ifft2(F);
figure(6);imshow(f,[]),title('reconstructed Image')