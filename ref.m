%read the leaf image
I = imread('jack-leaf.jpg');

%Convert to Gray Scale
IGray = rgb2gray(I);

%Gray scale morphological transformation
se = strel('disk',3); %strel('line',3,45); doesnt count the midrib
IGrayM = imdilate(IGray,se);
IGrayMOp = imopen(IGrayM,se);

subplot(2,2,1),
imshow(IGray),
subplot(2,2,2),
imshow(IGrayM),
subplot(2,2,3),
imshow(IGrayMOp),
subplot(2,2,4),