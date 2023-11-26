A = imread('jerry.png');

figure;
imshow(A);
title('Original Image');

B = imcrop(A);
se1 = B;
se2 = ~B;

bw = bwhitmiss(A, se1, se2);

[i, j] = find(bw == 1);

figure;
g = strel('disk', 15);
bw = imdilate(bw, g);

% Convert to grayscale for visualization
bw_grayscale = uint8(bw) * 255;

imshow(bw_grayscale);
title('Output of Hit and Miss Transform');
