#include <iostream>  
#include <opencv2/core/core.hpp>  
#include <opencv2/highgui/highgui.hpp>  
using namespace cv;    
int main()  
{  
    Mat img=imread("a.jpg");//����һ��ͼƬ
    namedWindow("Test");      //����һ����ΪTest����
    imshow("Test",img);   //��������ʾͼ��
    waitKey(5000);            //�ȴ�5000ms�󴰿��Զ��ر�
}  