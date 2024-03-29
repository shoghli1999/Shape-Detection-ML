function [ output_args ] = getfeature( input_args )
%GETFEATURE Summary of this function goes here
%   Detailed explanation goes here

dataset=zeros(20,2500);
j=1;
for i2=1:20
    if i2==6 || i2==11 || i2==16
        j=1;
    end
        if i2<6
            i=imread(['trainPic\a',num2str(j),'.jpg']);
            
        elseif i2<11
            i=imread(['trainPic\b',num2str(j),'.jpg']);
        elseif i2<16
            i=imread(['trainPic\c',num2str(j),'.jpg']);
        end
a=rgb2gray(i);
bw=edge(a,'canny');
bw = bwareaopen(bw,30);
se = strel('disk',2);
bw = imclose(bw,se);
bw = imfill(bw,'holes');
bw=removeback(bw);
L = bwlabel(bw);
s  = regionprops(L, 'centroid');
dt  = regionprops(L, 'area');
cv = regionprops(L, 'perimeter');
BW_filled = imfill(bw,'holes');
boundaries = bwboundaries(BW_filled);
%imshow(bw);
bw=imresize(bw,[50 50]);
dataset(i2,:)=reshape(bw,1,2500);

end
end

