#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>

using namespace cv;
int main()
{
	Mat srcImage = imread("yinghua.jpg");
	imshow("ԭͼ",srcImage);

	Mat element = getStructuringElement(MORPH_RECT,Size(15,15));
	Mat dstImage;
	erode(srcImage,dstImage,element);
	imshow("Ч��ͼ-��ʴ����",dstImage);

	system("pause");
	return 0;
}