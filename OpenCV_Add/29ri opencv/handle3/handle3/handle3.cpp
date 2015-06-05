#include <iostream>  
#include <opencv2/core/core.hpp>  
#include <opencv2/highgui/highgui.hpp>  
using namespace cv;    
int main(void)  
{  
	Mat img = imread("00.jpg");   //读入一张图片
	namedWindow("Test");         //创建一个名为Test窗口
	imshow("Test",img);          //窗口中显示图像
	waitKey(5000);               //等待5000ms后窗口自动关闭

	//system("pause");
	return 0;

}  