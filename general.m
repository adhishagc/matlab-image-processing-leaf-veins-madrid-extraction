clear all;
%read the leaf image
I = imread('jack-leaf.jpg');

%Convert to Gray Scale
IGray = rgb2gray(I);
IGrayOri = IGray;
IGray = histeq(IGray);
IGray = imadjust(IGray,[120/255 130/255]);

se2 = strel('disk',1); %strel('line',3,45); doesnt count the midrib

IGray = imdilate(IGray,se2);


%Convert to Binary
IBin = im2bw(IGray,129/255); %141/255 disk 3 initially



ed = edge(IBin,'roberts');

%ed_neg = medfilt2(ed_neg,[3 3]); % doesnt seem to do well

%structuring
se = strel('disk',1); %strel('line',3,45); doesnt count the midrib
imdil = imdilate(ed,se);
imdil = bwareaopen(imdil, 900);
imdil_neg = imcomplement(imdil);

%ed_neg = imcomplement(ed); good outputs
%ed_neg = bwareaopen(ed_neg, 50);

%noise
%ed_neg_nf = medfilt2(ed_neg,[3 3]);
%ed_neg_nf = imerode(ed_neg_nf,se);
%ed_neg_nf = bwareaopen(ed_neg_nf, 20);
%ed_neg_nf = medfilt2(ed_neg,[3 3]);
%ed_neg_nf = imcomplement(ed_neg_nf);
%ed_neg_nf = imdilate(ed_neg_nf,se);
%ed_neg_nf = imcomplement(ed_neg_nf);

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

imshow(IGrayOri)

%subplot(1,2,1),
%imshow(ed_neg_nf),
%subplot(1,2,2),
%imshow(imdil_neg)