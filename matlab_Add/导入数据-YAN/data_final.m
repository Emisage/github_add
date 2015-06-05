%% 
% 将下面的name命名 跟excel文件名相同 即可； 其它不用再更改了
% 可以加求解均值的代码，对data和data1进行操作
figure
name = '201410';                 %  这个name与excel的文件名相同;更改此处名称即可，方便画图标记和最后保存图片的命名
data1 = xlsread(name,'sheet1');
data = xlsread(name,'page 1');   %% 注意page 1命名中的空格 （建议还是直接按照sheet2命名）
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
print(gcf,'-djpeg', strcat(name,'.jpg'));  % 保存图片到当前文件夹,并且命名为name.jpg

