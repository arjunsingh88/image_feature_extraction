function [f] = fwht1()
Z = imread('H:\image\letterz.jpeg');
B = imread('H:\image\B.png');
X = imread('H:\image\X.png');

warning off %#ok<WNOFF>

Z1 = imresize(Z,[32 32]); 
if size(Z1,3)==3
      Z1=rgb2gray(Z1);  % use if the image containing RGB value 3
end
Zout  = imbinarize(Z1);
Z_oned = Zout(:);
Z_onedd = Z_oned - mean(Z_oned);
[n m] = size(Z_oned);
H = fwht(n);    % Hadamard matrix
Z_walsh = H*Z_oned;
Z_walsh1 = H*Z_onedd;
   mean(Z_oned)    
stem(Z_walsh)
B1 = imresize(B,[32 32]); 
if size(B1,3)==3
      B1=rgb2gray(B1);  % use if the image containing RGB value 3
end
Bout  = imbinarize(B1);
B_oned = Bout(:);
B_onedd = B_oned - mean(B_oned);
[n m] = size(B_oned);
H = fwht(n);    % Hadamard matrix
B_walsh = H*B_oned;
B_walsh1 = H*B_onedd;
mean(B_oned)


X1 = imresize(X,[32 32]); 
if size(X1,3)==3
      X1=rgb2gray(X1); % use if the image containing RGB value 3
end
Xout  = imbinarize(X1);
X_oned = Xout(:);
X_onedd = X_oned - mean(X_oned);
[n m] = size(X_oned);
H = fwht(n);    % Hadamard matrix
X_walsh = H*X_oned;
X_walsh1 = H*X_onedd;
mean(X_oned)



% plotting figure comparison
figure
subplot(2,1,1)
plot(Z_walsh,'r')
hold on
plot(B_walsh,'g')
hold on
plot(X_walsh,'b')
legend('Z','B','X')
title('frequency plot for Walsh Of Z,B,X')

subplot(2,1,2)
plot(Z_walsh1,'r')
hold on
plot(B_walsh1,'g')
hold on
plot(X_walsh1,'b')
legend('Z','B','X')
title('frequency plot for Walsh Z,B,X - Mean/normalized frequency')


% Forier transform of alphabets
Fs = 1000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 1500;             % Length of signal
t = (0:L-1)*T; 
Zfft = fft(Z_onedd);
Bfft = fft(B_onedd);
Xfft = fft(X_onedd); 


Zfft1 = abs(fft(Z_oned));
Bfft1 = abs(fft(B_oned));
Xfft1 = abs(fft(X_oned)); 
% P2 = abs(Zfft/L);
% P1 = P2(1:L/2+1);
% P1(2:end-1) = 2*P1(2:end-1);
% plot(Fs,P1) 
% title('Single-Sided Amplitude Spectrum of X(t)')
% xlabel('f (Hz)')
% ylabel('|P1(f)|')
 
figure
subplot(2,1,1)
plot(1000*t(1:512),Zfft(1:512),'r') 
hold on
plot(1000*t(1:512),Bfft(1:512),'b') 
hold on  
plot(1000*t(1:512),Xfft(1:512),'g') 
legend('Z','B','X')
title('fourier transform for Z,B,X')    

subplot(2,1,2)
plot(1000*t(1:512),Zfft1(1:512),'r') 
hold on
plot(1000*t(1:512),Bfft1(1:512),'b') 
hold on  
plot(1000*t(1:512),Xfft1(1:512),'g') 
legend('Z','B','X')
title('fourier transform for Z,B,X')   


% y = fwht(newin,N,'sequency'); %Perform Fast-walsh-hadamard-transform with order 128
% disp(H)
% plot(H)
% imshow(H); %Display image transform
% figure;
% imshow(In);
% disp(I)
% whos In
% out  = imbinarize(In);


