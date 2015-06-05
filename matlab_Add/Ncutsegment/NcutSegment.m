% NcutSegment:����Ncut�ķָ�������طָ����ͼ��
%
% segI = NcutSegment(I, NI, NX, r, sNcut, sArea)
% �������:
% I:ͼ�����,��СΪnRow*nCol*c,c��ʾͼ���ά��,c=1�Ҷ�ͼ��,c=3��ɫͼ��
% NI:Ȩ�غ���W����
% SX:Ȩ�غ���W����
% r:Ȩ�غ���W���������Ʊߵ������������ص�֮��ľ������r���ޱ�
% sNcut:�������ʱ�����Ncutֵ��������ָ����
% sArea:�ָ��������С���ص����
% ���������
% segI:�ָ����ͼ�񼯺�
%

function segI = NcutSegment(I, NI, NX, r, sNcut, sArea)
[nRow, nCol, c] = size(I);
N = nRow * nCol;
% ���д洢ͼ�����I��Ԫ�أ���ͼ�����ж��㣬�����γɸ����ָ�ͼ��
V = reshape(I, N, c); 
% ����Ȩ�ؾ���W
W = computeW(I, NI, NX, r);
% �������ص��λ����Ϣ����Ϊ�����������ص������
seg = (1:N)'; 
% ���ݹ�ʽ���ݹ�ļ�����ָ���sub,�ָ�·��ids,ÿһ�ζ���ʱ����СNcutֵ
[sub ids ncuts] = Segment(seg, W, sNcut, sArea, 'ROOT');
% ���ָ���ת��Ϊ������ͼ�񣬲�������segI�ṹ����
for i=1:length(sub) %�ָ�����ĸ���
% �γɺ�ɫ���ɫ����������������ʾ�ָ�������ͼ��
subV = zeros(N, c); %ones(N, c) * 255;
subV(sub{i}, :) = V(sub{i}, :); % ����Ӧ��������λ�õ�����ֵ������������
segI{i} = uint8(reshape(subV, nRow, nCol, c)); % ������ת��Ϊͼ�����
fprintf('%s. Ncut = %f\n', ids{i}, ncuts{i}); 
end
end