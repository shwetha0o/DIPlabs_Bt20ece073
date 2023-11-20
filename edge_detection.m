% Read the image
originalImage = imread('Signature.png'); % Replace 'your_image.jpg' with the actual image file name

% Convert the image to grayscale
grayImage = rgb2gray(originalImage);

% Define the Sobel operator kernels for horizontal and vertical edges
sobelHorizontal = [-1, -2, -1; 0, 0, 0; 1, 2, 1];
sobelVertical = [-1, 0, 1; -2, 0, 2; -1, 0, 1];

% Apply convolution to detect horizontal and vertical edges
edgeHorizontal = conv2(double(grayImage), sobelHorizontal, 'same');
edgeVertical = conv2(double(grayImage), sobelVertical, 'same');

% Combine horizontal and vertical edges to get the overall edge magnitude
edgeMagnitude = sqrt(edgeHorizontal.^2 + edgeVertical.^2);

% Normalize the edge magnitude to the range [0, 255]
edgeMagnitude = uint8((edgeMagnitude / max(edgeMagnitude(:))) * 255);

% Apply a threshold to obtain a binary edge map
threshold = 50; % Adjust the threshold based on your image
binaryEdgeMap = edgeMagnitude > threshold;

% Display the results
figure;
subplot(2, 2, 1);
imshow(grayImage);
title('Original Grayscale Image');

subplot(2, 2, 2);
imshow(edgeMagnitude, []);
title('Edge Magnitude');

subplot(2, 2, 3);
imshow(binaryEdgeMap);
title('Binary Edge Map');

