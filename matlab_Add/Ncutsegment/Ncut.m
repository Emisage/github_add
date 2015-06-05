% Ncut: ��������������СNcutֵ
%
% ncut = Ncut(t, U2, D, W);
% ���뺯����
% t:���ŷ��ѵ�
% U2:�ڶ�С����ֵ��Ӧ����������
% W:Ȩ�ؾ���
% D:�Ⱦ���
% ���������
% ncut������������С��Ncutֵ
%
function ncut = Ncut(t, U2, W, D)
% ���ݷָ��t�γ���Ӧ��ָʾ����x
x = (U2 > t);
x = (2 * x) - 1; 
d = diag(D);
k = sum(d(x > 0)) / sum(d);
b = k / (1 - k);
y = (1 + x) - b * (1 - x);
ncut = (y'* (D - W) * y) / ( y' * D * y );
end