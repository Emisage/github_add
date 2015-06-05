clear all;
close all;
clc;

img=imread('Pro.jpg');
%//////img = im2bw(img);
%img=imread('rice.png');
img=img>128;
img = im2double(img);
imshow(img,[]);
[m,n]=size(img);

imgn=zeros(m,n);        %�߽���ͼ��
ed=[-1 -1;0 -1;1 -1;1 0;1 1;0 1;-1 1;-1 0]; %�����Ͻ����أ���ʱ������
for i=2:m-1
    for j=2:n-1
        if img(i,j)==1 && imgn(i,j)==0      %��ǰ��û��ǵİ�ɫ����
            if sum(sum(img(i-1:i+1,j-1:j+1)))~=9    %���ڲ��İ����ز����
                ii=i;         %���ؿ��ڲ���Ѱʹ�õ�����
                jj=j;
                imgn(i,j)=2;    %�����ؿ��һ����ǵı߽磬��һ���߽�����Ϊ2
                
                while imgn(ii,jj)~=2    %�Ƿ��������ؿ���ѰһȦ�ˡ�
                    for k=1:8           %��ʱ�����������
                        tmpi=ii+ed(k,1);        %��������ʱ����
                        tmpj=jj+ed(k,2);
                        if img(tmpi,tmpj)==1 && imgn(tmpi,tmpj)~=2  %�������±߽磬����û������һȦ
                            ii=tmpi;        %�����ڲ���Ѱ���꣬��������
                            jj=tmpj;
                            imgn(ii,jj)=1;  %�߽���ͼ������ر�ǣ���ͨ�߽�Ϊ1
                            break;
                        end
                    end
                end
                
            end
        end
    end
end

figure;
imgn=imgn>=1;
imshow(imgn,[]);

%����Ҫ����ȡ��ֵͼ���ڱ߽磬ͨ����ԭͼ��ȥ�丯ʴͼ������
se = strel('square',3); 

imgn=img-imerode(img,se);    
figure;
imshow(imgn)

