clear all;
%read the leaf image
I = imread('jack-leaf.jpg');

%Convert to Gray Scale
IGray = rgb2gray(I);
IGrayOri = IGray; %backup the variable

%Image enhancement using histogram equalization
IGray = histeq(IGray);
%image instensity adjust
IGray = imadjust(IGray,[130/255 135/255]);
%imshow(IGray);

%convert to binary image
IBin = im2bw(IGray,129/255); %141/255 disk 3 initially

%dilate (Not in use)
%se2 = strel('line',3,45); %strel('line',3,45); doesnt count the midrib
%IGray = imdilate(IBin,se2);

%edge detection filter
ed = edge(IBin,'canny');
%imshow(ed);


%ed_neg = medfilt2(ed_neg,[3 3]); % doesnt seem to do well

%structuring
%dilating the image
se = strel('disk',1); %strel('line',3,45); doesnt count the midrib
imdil = imdilate(ed,se);
imdil = medfilt2(imdil,[3 3]);
%removing small objects in the space
%imdil = bwareaopen(imdil, 300);

imdil_neg = imcomplement(imdil);
%imshow(imdil_neg);


%get dimensions of the image
[r,c] = size(IGray);
IGrayEdit = IGray;
for i=1:r
    for j=1:c
        val = imdil_neg(i,j); 
        if val == 0
            IGrayOri(i,j) = 255;
        end
    end
end

imtool(imdil_neg);

%subplot(1,2,1),
%imshow(ed_neg_nf),
%subplot(1,2,2),
%imshow(imdil_neg)