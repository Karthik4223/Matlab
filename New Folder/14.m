%IMAGE SMOOTHING

clc;
clear all;
close all;
f=imread('image.png');
subplot(2,2,1),imshow(f),title('Input Image');
w=1/9*ones(3);
g1=imfilter(f,w);
subplot(2,2,2),imshow(g1)
title('Image smoothened by square averaging')
title('Image smoothened by square averaging filter mask of size 3 x 3');
w=1/25*ones(5);
g2=imfilter(f,w);
subplot(2,2,3),imshow(g2)
title('Image smoothened by square averaging filter mask of size 5 x 5');
w=1/81*ones(9);
g3=imfilter(f,w);
subplot(2,2,4),imshow(g3)
title('Image smoothened by square averaging filter mask of size 9 x 9');
w=1/225*ones(15);
g4=imfilter(f,w);
figure,subplot(1,2,1),imshow(g4)
title('Image smoothened by square averaging filter mask of size 15 x 15');
w=1/1225*ones(35);
g5=imfilter(f,w);
subplot(1,2,2),imshow(g5)
title('Image smoothened by square averaging filter mask of size 35 x 35');