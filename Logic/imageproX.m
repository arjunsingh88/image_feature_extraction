function [f] = imageproX()
Z = imread('H:\image\I813.png');
B = imread('H:\image\I814.png');
X = imread('H:\image\I814.png');

warning off %#ok<WNOFF>


Z1 = imresize(Z,[63 64]); 
% Z1 = [Z1; ones(1,64)*0];
if size(Z1,3)==3
      Z1=rgb2gray(Z1);  % use if the image containing RGB value 3
end
Zout  = imbinarize(Z1);

%  Zout = Zout-mean(Zout);
% zoned=Zout(:)
H1 = hadamard(64);
for i =1:63     
wcof(:,i) = H1* Zout(i,:)';
end
disp(wcof)
subplot(2,1,1)
plot(wcof(:))
title('2 different font family for alphabet O')
B1 = imresize(B,[63 64]); 
% B1 = [B1; ones(1,64)*0];
if size(B1,3)==3
      B1=rgb2gray(B1);  % use if the image containing RGB value 3
end
Bout  = imbinarize(B1);

%  Bout = Bout-mean(Bout);
% zoned=Zout(:)
H1 = hadamard(64);
for j =1:63     
Bcof(:,j) = H1* Bout(j,:)';
end
disp(Bcof)
subplot(2,1,2)
plot(Bcof(:))

