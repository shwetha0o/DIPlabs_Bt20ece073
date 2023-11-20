% Read the original image
originalImage = imread('Signature.png'); % Replace 'your_image.jpg' with the actual image file name

% Create a watermark (text in this case)
watermarkText = 'Snehal Patil';

% Convert the image to double for manipulation
watermarkedImage = double(originalImage);

% Get the size of the image
[rows, cols, ~] = size(watermarkedImage);

% Create a transparent text image as the watermark
fontSize = 20;
watermark = insertText(zeros(rows, cols, 'uint8'), [cols - 200, rows - 50], watermarkText, 'FontSize', fontSize, 'TextColor', 'white', 'BoxOpacity', 0);

% Convert the watermark to double for manipulation
watermark = double(watermark);

% Define the transparency level (adjust as needed)
alpha = 0.5;

% Blend the watermark with the original image
watermarkedImage(rows-size(watermark,1)+1:rows, cols-size(watermark,2)+1:cols, :) = ...
    watermarkedImage(rows-size(watermark,1)+1:rows, cols-size(watermark,2)+1:cols, :) * (1 - alpha) + ...
    watermark * alpha;

% Convert the result back to uint8 for display
watermarkedImage = uint8(watermarkedImage);

% Display the results
figure;
subplot(1, 2, 1);
imshow(originalImage);
title('Original Image');

subplot(1, 2, 2);
imshow(watermarkedImage);
title('Watermarked Image');

% Save the watermarked image
imwrite(watermarkedImage, 'watermarked_image.jpg');
