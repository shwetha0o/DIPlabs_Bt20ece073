clc;
clear all;
close all;

img=imread('shwetha.jpg'); %converting image to matrix
im_red=img;
im_green=img;
im_blue=img;
imshow(img); % displaying original image
%displaying red 
im_red(:,:,2) = 0; 
im_red(:,:,3) = 0; 
figure, imshow(im_red);

% Green channel only
im_green(:,:,1) = 0; 
im_green(:,:,3) = 0; 
figure, imshow(im_green);

% Blue channel only
im_blue(:,:,1) = 0; 
im_blue(:,:,2) = 0; 
figure, imshow(im_blue);
%extracting r,g,b
r=img(:,:,1);
g=img(:,:,2);
b=img(:,:,3);

[m,n,~] =size(img);
gimg=zeros(m,n,'uint8');%creating a mXn matrix containing all zeroes
gimg2=zeros(m,n,'uint8');%creating a mXn matrix containing all zeroes

%converting to grayscale using average formula
for i=1:m
    for j=1:n
        gimg(i,j)=round((r(i,j)+b(i,j)+g(i,j))/3);
    end
end
figure,imshow(gimg)
%converting to grayscale using standard formula
for i=1:m
    for j=1:n
        gimg2(i,j)=round((r(i,j)+b(i,j)+g(i,j))/3);
    end
end
figure,imshow(gimg2)
Ima=rgb2gray(img);
imshow(Ima);
for i=1:m
    for j=1:n
        if(Ima(i,j)<128)
            Ima(i,j)=0;
        else 
            Ima(i,j)=1;
        end
        
    end
end
