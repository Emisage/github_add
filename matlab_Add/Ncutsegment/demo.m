function demo
close all;clc;clear;
% ��������ʱ��
tic
% �������
% NI:Ȩ�غ���W����
% NX:Ȩ�غ���W����
% r:Ȩ�غ���W���������Ʊߵ������������ص�֮��ľ������r���ޱ�
% sNcut:�������ʱ�����Ncutֵ��������ָ����
% sArea:�ָ��������С���ص����
NI =0.1; NX =10; r = 1.5; sNcut =0.005; sArea =850;
% ��ȡͼƬ
name_int = 'lexus-GX'; % 'lexus-GX';   % 'lexus-GX';
% name = 'bird.jpg';   
name = strcat(name_int,'.jpg');
I = imread(strcat('.\',name));

% I = rgb2gray(I);
% I = I(150:250,150:250);
% ����Ncut׼�����ͼƬ�ָ�����طָ����ͼ�񼯺�segI
segI = NcutSegment(I, NI, NX, r, sNcut, sArea);
% ��ʾԭʼͼ��
imshow(name)
% ��ʾ�ָ��������ͼ�񲢱���
for i=1:length(segI)
    figure; imshow(segI{i});
    imwrite(segI{i}, [strcat('.\',name_int,'-'),num2str(i),'.png']);
end
toc
end