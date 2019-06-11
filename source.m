%read the leaf image
I = imread('jack-leaf.jpg');

%Convert to Gray Scale
IGray = rgb2gray(I);

%Convert to Binary
IBin = im2bw(IGray,141/255);



ed = edge(IBin,'roberts');

%ed_neg = medfilt2(ed_neg,[3 3]); % doesnt seem to do well

%structuring
se = strel('disk',3);
imdil = imdilate(ed,se);
imdil_neg = imcomplement(imdil);
ed_neg = imcomplement(ed);

subplot(1,2,1),
imshow(ed_neg),
subplot(1,2,2),
imshow(imdil_neg)