%read the leaf image
I = imread('mango-leaf.jpg');

%background removal using HSV colour space thresholding
%TO DO : Write the code from scratch
[bwimg, rgbimg] = background_removal(I);

%preview returns
%figure, imshow(bwimg);
%figure, imshow(rgbimg);

grayI = rgb2gray(rgbimg);
imshow(grayI);
