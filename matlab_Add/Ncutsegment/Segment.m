% Segment:�ָ�������ù�ʽ���еݹ�ָ�
%
% [sub ids ncuts] = Segment(seg, W, sNcut, sArea, id)
% �������:
% seg:���ָ�����򣬴洢���������������ص��ͼ�����λ����Ϣ
% W:�ָ������Ȩ�ؾ���
% sNcut:�������ʱ�����Ncutֵ��������ָ����
% sArea:�ָ��������С���ص����
% id:�ָ�·���ı�ǩ���Ե��Ժ��а���
% ���������
% sub:�ָ�������
% ids:�ָ�����·����ǩ���ϣ����ڵ���
% ncuts���ָ��������СNcutֵ����
%

function [sub ids ncuts] = Segment(seg, W, sNcut, sArea, id)
% ����Ⱦ���D
N = length(W);
d = sum(W, 2);  % �������������ж�������Ƴ̶�
D = spdiags(d, 0, N, N); % �Ⱦ���D 
% ����ʾ����
warning off;
% ����eigs��������ǰ������С������ֵ�����Ӧ����������
% U:�洢����ֵ��Ӧ����������
% S:�洢����ֵ
[U,S] = eigs(D-W, D, 2, 'sm');
% ��ȡ�ڶ�С������ֵ��Ӧ����������
U2 = U(:,1);
% ѡ��0��Ϊ�ڶ�С���������ķ��ѵ����ͼ�Ķ��ָ�ٶȿ쵫Ч������
% A = find(U2 > 0);
% B = find(U2 <= 0);
% ѡ��ڶ�С������������ֵ��Ϊ���ѵ㣬�ٶȺ�Ч��������
% t = median(U2);
% A = find(U2 > t);
% B = find(U2 <= t);
% ѡ��ָ�ͼNcutֵ��С�ĵ���Ϊ�ָ�㣬�˵��ھ�ֵ����
t = mean(U2); 
% ʹ��fminsearch��������tΪ�����в�����С�ķָ��
t = fminsearch('Ncut', t, [], U2, W, D);
% ���ݷָ��t����Ϊ��������A��B
A = find(U2 > t);
B = find(U2 <= t);
% ����Ncut����������ָ���С��Ncutֵ
ncut = Ncut(t, U2, W, D);
% ����ֹͣ׼���ж��Ƿ����ͼ������������ֹͣ����
if (length(A) < sArea || length(B) < sArea) || ncut > sNcut
sub{1} = seg;
ids{1} = id;
ncuts{1} = ncut;
return;
end
% �ݹ�ָ�
[subA idsA ncutsA] = Segment(seg(A), W(A, A), sNcut, sArea, [id '-A']);
[subB idsB ncutsB] = Segment(seg(B), W(B, B), sNcut, sArea, [id '-B']);
% �洢�ָ��������·������СNcutֵ
sub = [subA subB];
ids = [idsA idsB];
ncuts = [ncutsA ncutsB];
end