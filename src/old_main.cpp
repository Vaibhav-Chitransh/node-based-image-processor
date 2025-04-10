#include <opencv2/opencv.hpp>
#include <iostream>

int main() {
    std::string imagePath = "../assets/test.jpg"; // path relative to build folder

    cv::Mat image = cv::imread(imagePath);

    if (image.empty()) {
        std::cerr << "❌ Failed to load image from " << imagePath << std::endl;
        return -1;
    }

    std::cout << "✅ Image loaded: " << image.cols << " x " << image.rows << std::endl;

    cv::imshow("Test Image", image);
    cv::waitKey(0);
    return 0;
}
