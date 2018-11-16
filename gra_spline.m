function [img1 img2 img3 img4] = gra_spline(img)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[m n]=size(img);
img1=zeros(m,n);
img2=zeros(m,n);
img3=zeros(m,n);
img4=zeros(m,n);
img1(1:2:m,1:2:n)=img(1:2:m,1:2:n);
img2(1:2:m,2:2:n)=img(1:2:m,2:2:n);
img3(2:2:m,2:2:n)=img(2:2:m,2:2:n);
img4(2:2:m,1:2:n)=img(2:2:m,1:2:n);
%45°图像三次样条插值
x=1:2:n;
y=img1(1:2:m,1:2:n);
pp=csapi(x,y);
img1(1:2:m,1:n-1)=fnval(pp,1:n-1);
x1=1:2:m;
y1=img1(1:2:m,1:n-1);
y1=y1';
pp=csapi(x1,y1);
img1(1:m-1,1:n-1)=(fnval(pp,1:m-1))';
img1(m,:)=img1(m-1,:);
img1(:,n)=img1(:,n-1);
%90°图像三次样条插值
x=2:2:n;
y=img2(1:2:m,2:2:n);
pp=csapi(x,y);
img2(1:2:m,2:n)=fnval(pp,2:n);
x1=1:2:m;
y1=img2(1:2:m,2:n);
y1=y1';
pp=csapi(x1,y1);
img2(1:m-1,2:n)=(fnval(pp,1:m-1))';
img2(m,:)=img2(m-1,:);
img2(:,1)=img2(:,2);
%135°图像三次样条插值
x=2:2:n;
y=img3(2:2:m,2:2:n);
pp=csapi(x,y);
img3(2:2:m,2:n)=fnval(pp,2:n);
x1=2:2:m;
y1=img3(2:2:m,2:n);
y1=y1';
pp=csapi(x1,y1);
img3(2:m,2:n)=(fnval(pp,2:m))';
img3(1,:)=img3(2,:);
img3(:,1)=img3(:,2);
%0°图像三次样条插值
x=1:2:n;
y=img4(2:2:m,1:2:n);
pp=csapi(x,y);
img4(2:2:m,1:n-1)=fnval(pp,1:n-1);
x1=2:2:m;
y1=img4(2:2:m,1:n);
y1=y1';
pp=csapi(x1,y1);
img4(2:m,1:n)=(fnval(pp,2:m))';
img4(1,:)=img4(2,:);
img4(:,n)=img4(:,n-1);
end

