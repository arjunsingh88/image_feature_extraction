function [f] = imagep()
Z = imread('H:\image\I812.png');
B = imread('H:\image\I813.png');
X = imread('H:\image\I814.png');

warning off %#ok<WNOFF>



Z1 = [Z; ones(1,64)*0];
if size(Z1,3)==3
      Z1=rgb2gray(Z1);  % use if the image containing RGB value 3
end
Zout  = imbinarize(Z1);

Z_onedd = Zout - mean(Zout);
[n m] = size(Zout);
H = getHadamardTransform(Zout,n);  % Hadamard matrix
plot(H(:),'r')
hold on
B1 = [B; ones(1,64)*0];
if size(B1,3)==3
      B1=rgb2gray(B1);  % use if the image containing RGB value 3
end
Bout  = imbinarize(B1);

B_onedd = Bout - mean(Bout);
[n m] = size(Bout);
H = getHadamardTransform(Bout,n)
plot(H(:),'b')