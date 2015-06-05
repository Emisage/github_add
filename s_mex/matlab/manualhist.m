function p = manualhist
%MANUALHIST 此处显示有关此函数的摘要
%   此处显示详细说明

% initialize
repeats = true;
quitnow = 'x';
p = twomodegauss(0.15,0.05,0.75,0.05,1,0.07,0.002);
while repeats
    s = input('Enter m1,sig1,m2,sig2,A1,A2,k or x to quit:','s');
    if s == quitnow
        break
    end
    
    v = str2num(s);
%     if numel(v) ~= 7
%         disp('incorrect number of inputs.')
%         continue
%     end
   
    p = twomodegauss(v(1),v(2),v(3),v(4),v(5),v(6),v(7));
    figure,plot(p)
    xlim([0 255])

end

