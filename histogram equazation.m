%histogram and histogram equazation

I=imread('tom.jfif')
In=I;	 %copy image
J=rgb2gray(I)

figure
subplot(1,3,1)
imshow(J)
subplot(1,3,2:3)
imhist(J)

P= histeq(J);
figure
subplot(1,3,1)
imshow(P)
subplot(1,3,2:3)
imhist(P)

