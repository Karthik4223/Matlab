% Program for ROI

load trees
I=ind2gray(X,map);
figure,imshow(I)
title('original image');
I2=roifill;
figure,imshow(I2)
title('OUTPUT IMAGE');
