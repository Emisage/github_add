#include <iostream>  
#include <opencv2/core/core.hpp>  
#include <opencv2/highgui/highgui.hpp>  
using namespace cv;    
int main(void)  
{  
	Mat img = imread("00.jpg");   //����һ��ͼƬ
	namedWindow("Test");         //����һ����ΪTest����
	imshow("Test",img);          //��������ʾͼ��
	waitKey(5000);               //�ȴ�5000ms�󴰿��Զ��ر�

	//system("pause");
	return 0;

}  