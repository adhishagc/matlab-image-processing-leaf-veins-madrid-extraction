%read the leaf image
I = imread('jack-leaf.jpg');

%Convert to Gray Scale
IGray = rgb2gray(I);

%se2 = strel('disk',3); %strel('line',3,45); doesnt count the midrib
%IGray = imdilate(IGray,se);

%Convert to Binary
IBin = im2bw(IGray,129/255); %141/255 disk 3 initially



ed = edge(IBin,'roberts');

%ed_neg = medfilt2(ed_neg,[3 3]); % doesnt seem to do well

%structuring
se = strel('disk',1); %strel('line',3,45); doesnt count the midrib
imdil = imdilate(ed,se);
imdil_neg = imcomplement(imdil);
ed_neg = imcomplement(ed);

%get dimensions of the image
[r,c] = size(IGray);
IGrayEdit = IGray;
for i=1:r
    for j=1:c
        val = imdil_neg(i,j); 
        if val == 0
            IGrayEdit(i,j) = 255;
        end
    end
end
imshow(IGrayEdit);

%subplot(1,2,1),
%imshow(IGray),
%subplot(1,2,2),
%imshow(IGrayEdit)