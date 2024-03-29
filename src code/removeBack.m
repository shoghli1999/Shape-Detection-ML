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