J=imread('tom.jfif')
I=rgb2gray(J)
BW=edge(I,'Prewitt')
figure
imshow(BW)

