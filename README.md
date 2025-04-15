# 🖼️ Node-Based Image Processor

A lightweight image processing application using **Dear ImGui** and **OpenCV**, designed to simulate a node-based interface for editing images. This implementation simplifies the structure into checkbox-driven feature selection, retaining modularity and ease of use.

> 📌 **Note**: This version does not include a graphical node connection system but provides equivalent functionality via toggled checkboxes and sliders.

---

## 🧰 Technologies Used

- **C++**
- **OpenCV** for image processing
- **Dear ImGui** for the graphical user interface
- **CMake** for build management

---

## 📸 Screenshot

![App UI](./assets/loaded_image.png)

_A modern, real-time image editing interface with live preview._

---

## 🧠 Features Implemented

### 1. Load and Save Image

- Easily load any `.png`, `.jpg`, `.bmp`, etc. format image.
- Save processed image to local storage.

![Load Image](./assets/load_image.png)

---

### 2. Apply Grayscale

Converts the image to grayscale.

✅ Enabled by checkbox.

![Grayscale](./assets/grayscale.png)

---

### 3. Apply Brightness

Adjust image brightness using a slider. Internally modifies pixel intensity values.

![Brightness Slider](./assets/brightness.png)

---

### 4. Apply Contrast

Enhances or reduces contrast based on linear transformations.

![Contrast Slider](./assets/contrast.png)

---

### 5. Apply Blur

Applies a **Gaussian blur** for smoothing the image.

📦 Uses `cv::GaussianBlur()` with fixed kernel size.

![Blur Slider](./assets/blur.png)

---

### 6. Apply Threshold

Binarizes the image using a fixed threshold. All pixel intensities above the threshold are set to white; others to black.

📦 `cv::threshold()` used with a default value.

![Binary Threshold Slider](./assets/threshold.png)

![Adaptive Threshold Slider](./assets/threshold_adaptive.png)

---

### 7. Apply Edge Detection

Performs **Canny Edge Detection** on the grayscale image.

📦 Uses `cv::Canny()` internally.

![Edge Detection](./assets/edge_detection.png)

---


### 8. Using Multiple Features

![](./assets/multiple_1.png)

![](./assets/multiple_2.png)


### 9. Saving the processed image

![Save Image](./assets/save_image.png)



---

## 🔧 How to Build

Make sure you have **CMake** and **OpenCV** installed.

```bash
git clone https://github.com/Vaibhav-Chitransh/node-based-image-processor.git
cd node-based-image-processor
mkdir build && cd build
cmake ..
nmake
node-based-image-processor.exe
```

