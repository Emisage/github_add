% NcutSegment:基于Ncut的分割函数，返回分割的子图像集
%
% segI = NcutSegment(I, NI, NX, r, sNcut, sArea)
% 输入参数:
% I:图像矩阵,大小为nRow*nCol*c,c表示图像的维数,c=1灰度图像,c=3彩色图像
% NI:权重函数W参数
% SX:权重函数W参数
% r:权重函数W参数，控制边的数量，两像素点之间的距离大于r则无边
% sNcut:区域二分时的最大Ncut值，超出则分割结束
% sArea:分割区域的最小像素点个数
% 输出参数：
% segI:分割的子图像集合
%

function segI = NcutSegment(I, NI, NX, r, sNcut, sArea)
[nRow, nCol, c] = size(I);
N = nRow * nCol;
% 按列存储图像矩阵I的元素，即图的所有顶点，用于形成各个分割图像
V = reshape(I, N, c); 
% 计算权重矩阵W
W = computeW(I, NI, NX, r);
% 所有像素点的位置信息，作为划分区域像素点的索引
seg = (1:N)'; 
% 根据公式，递归的计算出分割结果sub,分割路径ids,每一次二分时的最小Ncut值
[sub ids ncuts] = Segment(seg, W, sNcut, sArea, 'ROOT');
% 将分割结果转换为各个子图像，并保存在segI结构体中
for i=1:length(sub) %分割区域的个数
% 形成黑色或白色背景向量，用于显示分割子区域图像
subV = zeros(N, c); %ones(N, c) * 255;
subV(sub{i}, :) = V(sub{i}, :); % 将对应的子区域位置的像素值赋给背景向量
segI{i} = uint8(reshape(subV, nRow, nCol, c)); % 将向量转换为图像矩阵
fprintf('%s. Ncut = %f\n', ids{i}, ncuts{i}); 
end
end