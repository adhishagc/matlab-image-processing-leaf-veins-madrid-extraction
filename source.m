%read the leaf image
I = imread('mango-leaf.jpg');

%background removal using HSV colour space thresholding
%TO DO : Write the code from scratch
[bwimg, rgbimg] = background_removal(I);

%preview returns
%figure, imshow(bwimg);
%figure, imshow(rgbimg);

%convert rgb inage to grey scale
grayI = rgb2gray(rgbimg);

%Adjust intensity values
grayIAdj = imadjust(grayI,[70/255 153/255]);

%figure,imhist(grayI);
%figure,imhist(grayIAdj);

%convert to binary
%imgBin = im2bw(grayIAdj,55/255)
%imgEdge = edge(grayI,'sobel',155)


%imshow(I);

%figure,imshow(grayI);
%figure,imshow(grayIAdj);
