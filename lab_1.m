clc;
clear all;
close all;

%converting image to matrix
img=imread('image.jpg'); 

im_red=img;
im_green=img;
im_blue=img;

 % displaying original image
imshow(img);

%extracting the red channel and displaying red 
im_red(:,:,2) = 0; 
im_red(:,:,3) = 0; 
figure, imshow(im_red);

%extracting the green channel and displaying green 
im_green(:,:,1) = 0; 
im_green(:,:,3) = 0; 
figure, imshow(im_green);

%extracting the blue channel and displaying blue 
im_blue(:,:,1) = 0; 
im_blue(:,:,2) = 0; 
figure, imshow(im_blue);

%extracting r,g,b
r=img(:,:,1);
g=img(:,:,2);
b=img(:,:,3);

[m,n,~] =size(img);
gimg=zeros(m,n,'uint8');%creating a mXn matrix containing all zeroes

%converting to grayscale using average formula
for i=1:m
    for j=1:n
        gimg(i,j)=round((r(i,j)+b(i,j)+g(i,j))/3);
    end
end
figure,imshow(gimg)


%converting to grayscale using inbuilt function
Ima=rgb2gray(img);
figure,imshow(Ima);

