% Load the image
image = imread('image.png');

% Convert the image to grayscale
gray_image = rgb2gray(image);

% Define Gaussian filter sizes
filter_sizes = [3, 5, 7];

% Apply Gaussian filtering
for k = 1:numel(filter_sizes)
    filter_size = filter_sizes(k);
    
    % Create a Gaussian filter
    sigma = 1; % You can adjust the value of sigma for different blurring effects
    half_size = (filter_size - 1) / 2;
    [X, Y] = meshgrid(-half_size:half_size, -half_size:half_size);
    gaussian_filter = exp(-(X.^2 + Y.^2) / (2 * sigma^2));
    gaussian_filter = gaussian_filter / sum(gaussian_filter(:));
    
    % Apply convolution using nested loops
    filtered_image = zeros(size(gray_image));
    
    for i = 1:size(gray_image, 1) - filter_size + 1
        for j = 1:size(gray_image, 2) - filter_size + 1
            window = gray_image(i:i+filter_size-1, j:j+filter_size-1);
            conv_result = sum(sum(double(window) .* gaussian_filter));
            filtered_image(i, j) = conv_result;
        end
    end
    
    % Display the filtered image
    figure;
    subplot(1, 2, 1);
    imshow(gray_image);
    title('Original Image');
    
    subplot(1, 2, 2);
    imshow(uint8(filtered_image));
    title(['Filtered Image (', num2str(filter_size), 'x', num2str(filter_size), ' Gaussian Filter)']);
end
