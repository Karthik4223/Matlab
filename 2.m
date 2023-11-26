J=imread('1.png');
K=imread('2.png')
figure;


figure
P=J+K
imshow(P)

figure
Q=J-K
imshow(Q)

figure
R=K.*K
imshow(R)

figure
U=J.*J
imshow(U)

figure
S=K./J
imshow(S)

figure
T=J./K
imshow(T)

background=imread('back.png')

background=imresize(background,[size(P,1) size(P,2)]);
Im3=uint8(zeros(size(P)));
whiteImg=uint8(ones(size(P)));

mask=whiteImg./P;

im3=uint8(mask&background);
figure
imshow(mask);

%Image multiplication
%Multiply the background and the mask image
%And the result with the foreground image to obtain the final Image.
finalImg=(background.*im3)+P;
figure
imshow(finalImg);

