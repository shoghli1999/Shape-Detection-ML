clc;
clear all;
close all;
%%
format long
x=getdata();

t=[1 -1 -1 -1;
   1 -1 -1 -1;
   1 -1 -1 -1;
   1 -1 -1 -1;
   1 -1 -1 -1;
   
   -1 1 -1 -1;
   -1 1 -1 -1;
   -1 1 -1 -1;
   -1 1 -1 -1;
   -1 1 -1 -1;
   
   -1 -1 1 -1;
   -1 -1 1 -1;
   -1 -1 1 -1;
   -1 -1 1 -1;
   -1 -1 1 -1;
   
   -1 -1 -1 1;
   -1 -1 -1 1;
   -1 -1 -1 1;
   -1 -1 -1 1;
   -1 -1 -1 1;
   ];



b=zeros(1,4);
b_old=zeros(1,4);

y_in=zeros(1,4);
y=zeros(1,4);
w=zeros(2500,4);
w_old=zeros(2500,4);
s=0;
epoch=0;
%%

while s==0
epoch=epoch+1;
    for i=1:20  %% tedade anasore amoozeshi
            for k=1:4  % tedade khorooji ha
                        y_in(k)=0;
                        for j=1 : 2500 % tedade voroodi ha
                            y_in(k)=y_in(k)+ w(j,k)*x(i,j);
                        end 
                        y_in(k)=y_in(k)+b(k);


                        if(y_in(k)>0)
                             y(k)=1;
                        elseif (y_in(k)<0)
                            y(k)=-1;
                        else
                             y(k)=0;
                        end

                        if(t(i,k)~=y(k))
                            for z=1:2500
                                w(z,k)=w(z,k)+x(i,z)*t(i,k);
                            end 
                            b(k)=b(k)+t(i,k);
                        end
             end
            
    end
     if ((w_old==w))
          s=1;
     else
          w_old=w;
          b_old=b;
    end
end
%%

[file,path]=uigetfile('D:\shirin\shive erae daneshgah\me\shapedetection\src\trainPic\b4.jpg');
i=imread([path,file]);

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
test=reshape(bw,1,2500);

imshow(bw);



% test
y=0;

result=zeros(1,4);
for k=1:4
for i=1:2500
    
    y=y+test(i)*w(i,k);
    
end
y=y+b(k);
if(y>=0)
    result(k)=1;
else
    result(k)=-1;
end
y=0;
end

disp(['Your Output array is : ']);
disp(result);

    if result== [ 1    -1    -1    -1    ]
        msgbox('Your test element is <morabaa>');
    elseif result== [ -1    1    -1    -1    ]
        msgbox('Your test element is <mosalas>');
    elseif result==[-1    -1   1    -1     ]
        msgbox('Your test element is <Circle>');
    elseif result==[ -1    -1    -1    1    ]
        msgbox('Your test element is <6 zelii>');
   
    else
        msgbox('Your test element is very Damaged');
    end



function [ dataset ] = getdata(  )
%GETDATA Summary of this function goes here
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

function [ x ] = removeBack( x )
%REMOVEBACK Summary of this function goes here
%   Detailed explanation goes here
x(:,1:5)=[];
x(:,end-5:end)=[];
x(1:5,:)=[];
x(end-5:end,:)=[];
while x(1,:)==0
    x(1,:)=[];
end
while x(:,1)==0
    x(:,1)=[];
end
while x(end,:)==0
    x(end,:)=[];
end
while x(:,end)==0
    x(:,end)=[];
end

x(:,1)=[];
x(:,end)=[];
x(1,:)=[];
x(end,:)=[];
end