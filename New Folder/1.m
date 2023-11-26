%Simulation and Display of an Image, Negative of an Image(Binary & Gray Scale)

% Red Blue and Green and Gray Components
i=imread('image.png');
subplot(3,2,1); imshow(i); title('Original Image');

%Red Component
r=i(:,:,1);
subplot(3,2,2); imshow(r);title('Red Component');

%Green Component
g=i(:,:,2);
subplot(3,2,3); imshow(g); title('Green Component');

%Blue Component
b=i(:,:,3);
subplot(3,2,4); imshow(b); title('Blue Component');

%Color to Gray Image
rg=rgb2gray(i);
subplot(3,2,5); imshow(rg); title('Gray Image');