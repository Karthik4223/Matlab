%Implementation of Transformations of an Image

%Scaling & Rotation
% Scaling (Resize)
I=imread('image.png');
subplot(2,2,1); subimage(I); title('Original Image');

s=input('Enter Scaling Factor');
j=imresize(I,s);
subplot(2,2,2); subimage(j); title('Scaled Image');
3

% Rotation
K=imrotate(j,60);
subplot(2,2,3); imshow(K); title('Rotated Image 60deg');

R=imrotate(j,45);
subplot(2,2,4); imshow(R); title('Rotated Image 45deg');


