% Ncut: 计算二分区域的最小Ncut值
%
% ncut = Ncut(t, U2, D, W);
% 输入函数：
% t:最优分裂点
% U2:第二小特征值对应的特征向量
% W:权重矩阵
% D:度矩阵
% 输出参数：
% ncut：二分区域最小的Ncut值
%
function ncut = Ncut(t, U2, W, D)
% 根据分割点t形成相应的指示向量x
x = (U2 > t);
x = (2 * x) - 1; 
d = diag(D);
k = sum(d(x > 0)) / sum(d);
b = k / (1 - k);
y = (1 + x) - b * (1 - x);
ncut = (y'* (D - W) * y) / ( y' * D * y );
end