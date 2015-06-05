clear;clc;
A = imread('1.jpg');
A = rgb2gray(A);
A = double(A);
nThreshold = 4;
[MS_reg,pUnRegion,region_index_sum,region_index_n] = meanshiftseg(A,nThreshold);