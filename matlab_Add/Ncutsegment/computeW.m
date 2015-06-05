% computeW:权重矩阵函数，用于计算边的权重值
%
% W = computeW(I, NI, NX, r)
% 输入参数:
% I:图像矩阵,大小为nRow*nCol*c,c表示图像的维数,c=1灰度图像,c=3彩色图像
% NI:权重函数W参数
% NX:权重函数W参数
% r：权重函数W参数，控制边的数量，两像素点之间的距离大于r则无边
% 输出参数：
% W:权重矩阵，W(i,j)表示了像素i和j之间的相似性
%
function W = computeW(I, NI, NX, r)
[nRow, nCol, c] = size(I);
N = nRow * nCol;
% 形成稀疏权重函数，稀疏存储仅存储非零值及其位置，节省了存储空间但运算较慢
W = sparse(N,N);
% W = zeros(N,N);
% 判断图像的类型
if c == 3  % 彩色图像
    F = F3(I);
else
    F = F2(I); % 灰度图像
end

% 高斯滤波器，对初始图像平滑去噪
% sigma=0.8;
% gausFilter=fspecial('gaussian',[3 3],sigma);
% F=imfilter(F,gausFilter,'replicate');

% 计算权重值
F = reshape(F, N, 1); 
% F = reshape(F, N, 1, c);     %\\\\\\\\\\
X = cat(3, repmat((1:nRow)', 1, nCol), repmat((1:nCol), nRow, 1));
X = reshape(X, N, 1, 2); 
for ic=1:nCol
    for ir=1:nRow
        jc = (ic - floor(r)) : (ic + floor(r)); 
        jr = ((ir - floor(r)) :(ir + floor(r)))';
        jc = jc(jc >= 1 & jc <= nCol);
        jr = jr(jr >= 1 & jr <= nRow);
        jN = length(jc) * length(jr);
        i = ir + (ic - 1) * nRow;
        j = repmat(jr, 1, length(jc)) + repmat((jc -1) * nRow, length(jr), 1);
        j = reshape(j, length(jc) * length(jr), 1);
        XJ = X(j, 1, :);
        XI = repmat(X(i, 1, :), length(j), 1);
        DX = XI - XJ;
        DX = sum(DX .* DX, 3);
        constraint = find(sqrt(DX) <= r);
        j = j(constraint);
        DX = DX(constraint);
        FJ = F(j, 1, :);
        FI = repmat(F(i, 1), length(j), 1);
%         FI = repmat(F(i, 1, :), length(j), 1);   % \\\\\\\\\\\\\\\
        FJ = double(FJ);
        FI = double(FI);
        DF = abs(FI - FJ);
        DF = sum(DF .* DF, 3);
        W(i, j) = exp(-DF / (NI*NI)) .* exp(-DX / (NX*NX)); 
    end
end

end