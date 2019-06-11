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

subplot(1,2,1),
imshow(IGray),
subplot(1,2,2),
imshow(IGrayEdit)