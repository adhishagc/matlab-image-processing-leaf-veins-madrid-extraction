%read the leaf image
I = imread('jack-leaf.jpg');

%Convert to Gray Scale
IGray = rgb2gray(I);

%Convert to Binary
IBin = im2bw(IGray,141/255);



ed = edge(IBin,'roberts');
ed_neg = imcomplement(ed);
%ed_neg = medfilt2(ed_neg,[3 3]); % doesnt seem to do well

imshow(ed_neg);