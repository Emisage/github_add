% Segment:分割函数，利用公式进行递归分割
%
% [sub ids ncuts] = Segment(seg, W, sNcut, sArea, id)
% 输入参数:
% seg:被分割的区域，存储了区域中所有像素点或图顶点的位置信息
% W:分割区域的权重矩阵
% sNcut:区域二分时的最大Ncut值，超出则分割结束
% sArea:分割区域的最小像素点个数
% id:分割路径的标签，对调试很有帮助
% 输出参数：
% sub:分割结果集合
% ids:分割区域路径标签集合，用于调试
% ncuts：分割区域的最小Ncut值集合
%

function [sub ids ncuts] = Segment(seg, W, sNcut, sArea, id)
% 计算度矩阵D
N = length(W);
d = sum(W, 2);  % 各个顶点与所有顶点的相似程度
D = spdiags(d, 0, N, N); % 度矩阵D 
% 不显示警告
warning off;
% 利用eigs函数计算前两个最小的特征值及其对应的特征向量
% U:存储特征值对应的特征向量
% S:存储特征值
[U,S] = eigs(D-W, D, 2, 'sm');
% 提取第二小的特征值对应的特征向量
U2 = U(:,1);
% 选择0最为第二小特征向量的分裂点进行图的二分割，速度快但效果不好
% A = find(U2 > 0);
% B = find(U2 <= 0);
% 选择第二小特征向量的中值作为分裂点，速度和效果都不好
% t = median(U2);
% A = find(U2 > t);
% B = find(U2 <= t);
% 选择分割图Ncut值最小的点作为分割点，此点在均值附近
t = mean(U2); 
% 使用fminsearch函数，以t为起点进行查找最小的分割点
t = fminsearch('Ncut', t, [], U2, W, D);
% 根据分割点t划分为两个区域A和B
A = find(U2 > t);
B = find(U2 <= t);
% 利用Ncut函数计算出分割最小的Ncut值
ncut = Ncut(t, U2, W, D);
% 根据停止准则判断是否二分图像，条件成立则停止划分
if (length(A) < sArea || length(B) < sArea) || ncut > sNcut
sub{1} = seg;
ids{1} = id;
ncuts{1} = ncut;
return;
end
% 递归分割
[subA idsA ncutsA] = Segment(seg(A), W(A, A), sNcut, sArea, [id '-A']);
[subB idsB ncutsB] = Segment(seg(B), W(B, B), sNcut, sArea, [id '-B']);
% 存储分割的子区域、路径和最小Ncut值
sub = [subA subB];
ids = [idsA idsB];
ncuts = [ncutsA ncutsB];
end