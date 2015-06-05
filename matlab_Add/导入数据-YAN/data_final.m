%% 
% �������name���� ��excel�ļ�����ͬ ���ɣ� ���������ٸ�����
% ���Լ�����ֵ�Ĵ��룬��data��data1���в���
figure
name = '201410';                 %  ���name��excel���ļ�����ͬ;���Ĵ˴����Ƽ��ɣ����㻭ͼ��Ǻ���󱣴�ͼƬ������
data1 = xlsread(name,'sheet1');
data = xlsread(name,'page 1');   %% ע��page 1�����еĿո� �����黹��ֱ�Ӱ���sheet2������
save '.\mat' data1 data   
plot(data(:,3),data(:,2),'o')
hold on
x=data1(:,3); 
y=data1(:,2);
plot(x,y,'r.','markersize',16)
hold on
plot([0.8431,0.8431],[2100,38000],'g-')
hold on
plot([0.3,1],[8565,8565],'g-')
axis([0.3,1,2100,38000]);
grid on
x_name = strcat(name,' on time'); 
xlabel(x_name);
ylabel('sample size');
title(name);
print(gcf,'-djpeg', strcat(name,'.jpg'));  % ����ͼƬ����ǰ�ļ���,��������Ϊname.jpg

