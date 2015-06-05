function demo
close all;clc;clear;
% 计算运行时间
tic
% 所需参数
% NI:权重函数W参数
% NX:权重函数W参数
% r:权重函数W参数，控制边的数量，两像素点之间的距离大于r则无边
% sNcut:区域二分时的最大Ncut值，超出则分割结束
% sArea:分割区域的最小像素点个数
NI =0.1; NX =10; r = 1.5; sNcut =0.005; sArea =850;
% 读取图片
name_int = 'lexus-GX'; % 'lexus-GX';   % 'lexus-GX';
% name = 'bird.jpg';   
name = strcat(name_int,'.jpg');
I = imread(strcat('.\',name));

% I = rgb2gray(I);
% I = I(150:250,150:250);
% 利用Ncut准则进行图片分割，并返回分割的子图像集合segI
segI = NcutSegment(I, NI, NX, r, sNcut, sArea);
% 显示原始图像
imshow(name)
% 显示分割出来的子图像并保存
for i=1:length(segI)
    figure; imshow(segI{i});
    imwrite(segI{i}, [strcat('.\',name_int,'-'),num2str(i),'.png']);
end
toc
end