function [f] = regioncount()
I1=imread('H:\image\X.png');
I2 = imresize(I1,[64 64]); 
In=I2;
% In=rgb2gray(I2); % use if the image containing RGB value 3
% In=rgb2gray(I1);
if size(In,3)==3
      In=rgb2gray(In);  % use if the image containing RGB value 3
end

figure;
imshow(In);
% whos In
% disp(I2)
out  = imbinarize(In);
disp(out)
[m,n] = size(out);
% disp(m)
% disp(n)

%Centroids
stats = regionprops(out);
disp(stats)
centroid = stats.Centroid;
disp(centroid)
% [y, x] = ndgrid(1:size(out, 1), 1:size(out, 2));
% centroid = mean([x(logical(out)), y(logical(out))]);

%vertical symmetry
sums=0;
for k= 0:(length(out)/2)-1
    c = 0;
    for i =1:length(out)
            if(out(i,(length(out)/2)-k)== out(i,(length(out)/2)+1+k))
               c=c+1;
            end
    end
    sums = sums+c;
%     disp(c)
end
 if (sums < (length(out)*length(out)/2))
     disp('not symmetric')
 else
     disp('Vertically symmetric')
 end


% horizontal symmetry
sums = 0;
for k= 0:(length(out)/2)-1
    c = 0;
    for i =1:length(out)
            if(out((length(out)/2)-k,i)== out((length(out)/2)+1+k,i))
               c=c+1;
            end
    end
    sums = sums+c;
%     disp(c)
end
 if (sums < (length(out)*length(out)/2))
     disp('not symmetric')
 else
     disp('Horizontally symmetric')
 end
 


%dividing the image into left right up down
left = out(:, 1 : end/2);
right = out(:, end/2+1 : end );



top = out(1 : end/2, :);
bottom = out(end/2+1 : end , :);
% disp(left)
% disp(right)
% disp(top)
% disp(bottom)
  
% No of regions
[~, numberOfClosedRegions] = bwlabel(out);
disp('no of regions')
disp(numberOfClosedRegions-1)

%Sum of pixel in left and right halves
L = sum(left(:));
R = sum(right(:));
% disp(L)
% disp(R)
% disp(sum(left))
% disp(sum(right))

% disp(bwarea(out))
% disp(bweuler(out))

% disp(abs(L-R)/min(L,R) * 100)



