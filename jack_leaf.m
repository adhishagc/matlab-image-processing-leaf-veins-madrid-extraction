clear all;
%read the leaf image
I = imread('jack-leaf.jpg');

%Convert to Gray Scale
IGray = rgb2gray(I);

%Convert to Binary
IBin = im2bw(IGray,129/255); %141/255 disk 3 initially

%compare IGray and IBinary
%imshow(imcomplement(IBin)),
%imtool(IBin);

%random white liquid kind of blobs are there. Therefore adjusting contrast
IAdj =  imadjust(IGray,[130/255 155/255]);
imshow(IAdj);
%in the above adjustment we were able to get much clearer veins
%but in this only the main veins are clear.

%compare
%subplot(1,2,1),
%imshow(IBin),
%subplot(1,2,2),
%imshow(IAdj);

%Convert to Binary
IBinAdj = im2bw(IAdj,129/255); %141/255 disk 3 initially

%compare
%subplot(1,2,1),
%imshow(IBin),
%subplot(1,2,2),
%imshow(IBinAdj);

%filter the image
IBinAdj = medfilt2(IBinAdj,[3 3]);
%imshow(IBinAdj);

%erod the image
%selection of a structuring element
se = strel('line',3,90); %when disk was used, only the main veins were visible.

IBinAdjErode = imerode(IBinAdj,se);
%imshow(IBinAdjErode); 

%remove small objects
IOpen = bwareaopen(IBinAdjErode, 10);

%filter the image
IOpenF = medfilt2(IOpen,[3 3]);

%dilate the image
IDil = imdilate(IOpenF,se);

%Image edge
ImEdge = edge(IDil, 'roberts');
ImEdge  = imdilate(ImEdge,se);
imshow(ImEdge);