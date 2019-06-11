%read the leaf image
I = imread('jack-leaf.jpg');

%Convert to Gray Scale
IGray = rgb2gray(I);

%Convert to Binary
IBin = im2bw(IGray);

ed = edge(IBin,'roberts');
ed_neg = imcomplement(ed);
imshow(ed_neg);