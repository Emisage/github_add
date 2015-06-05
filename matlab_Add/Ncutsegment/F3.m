function F = F3(I)
% hsv, for color
F =rgb2gray(I); % raw RGB
F = double(F)/255;
% Below hsv resulted in errors at eigs(). eigs returns erros so often.
% F = rgb2hsv(double(I)); % V = [0, 255] with double, V = [0, 1] without double
% % any fast way in matlab?
% [nRow nCol c] = size(I);
% for i=1:nRow
% for j=1:nCol
% HSV = reshape(F(i, j, :), 3, 1);
% h = HSV(1); s = HSV(2); v = HSV(3);
% F(i, j, :) = [v v*s*sin(h) v*s*cos(h)];
% end
% end
end