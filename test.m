clear all;
I = imread('jack-leaf.jpg');

IGray = rgb2gray(I);
IBin = im2bw(IGray,141/255);
ed = edge(IBin,'roberts');
se = strel('disk',3);
imdil = imdilate(ed,se);
imdil_neg = imcomplement(imdil);

%x = imdil_neg(1,1);

for i=1:100
    x = imdil_neg(i,1);
    
    if x == 1
        disp('hey');
    end
end