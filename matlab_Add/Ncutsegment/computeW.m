% computeW:Ȩ�ؾ����������ڼ���ߵ�Ȩ��ֵ
%
% W = computeW(I, NI, NX, r)
% �������:
% I:ͼ�����,��СΪnRow*nCol*c,c��ʾͼ���ά��,c=1�Ҷ�ͼ��,c=3��ɫͼ��
% NI:Ȩ�غ���W����
% NX:Ȩ�غ���W����
% r��Ȩ�غ���W���������Ʊߵ������������ص�֮��ľ������r���ޱ�
% ���������
% W:Ȩ�ؾ���W(i,j)��ʾ������i��j֮���������
%
function W = computeW(I, NI, NX, r)
[nRow, nCol, c] = size(I);
N = nRow * nCol;
% �γ�ϡ��Ȩ�غ�����ϡ��洢���洢����ֵ����λ�ã���ʡ�˴洢�ռ䵫�������
W = sparse(N,N);
% W = zeros(N,N);
% �ж�ͼ�������
if c == 3  % ��ɫͼ��
    F = F3(I);
else
    F = F2(I); % �Ҷ�ͼ��
end

% ��˹�˲������Գ�ʼͼ��ƽ��ȥ��
% sigma=0.8;
% gausFilter=fspecial('gaussian',[3 3],sigma);
% F=imfilter(F,gausFilter,'replicate');

% ����Ȩ��ֵ
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