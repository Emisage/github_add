function fun
%FUN �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
plot(rand(3,5));
h2 = uicontrol('style','edit','TooltipString','Edit Text','Position',[80,0,30,20]);
h3 = uicontrol('style','text','Position',[440,0,30,20],'TooltipString','Static Text');
set(h2,'BackGroundColor',[0 0 1]);
set(h3,'BackGroundColor',[1 0 0]);

end

