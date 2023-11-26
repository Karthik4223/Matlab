%Display of FFT(1-D & 2-D) of an image

l=im2double(imread('image.png'));


f1=fft(l);
f2=fftshift(f1);

subplot(2,2,1); imshow(abs(f1)); title('Frequency Spectrum');
subplot(2,2,2); imshow(abs(f2)); title('Centered Spectrum');

f3=log(1+abs(f2));
subplot(2,2,3); imshow(f3); title('log(1+abs(f2))');

l=fft2(f1);
l1=real(l);

subplot(2,2,4); imshow(l1);title(' 2-D FFT');