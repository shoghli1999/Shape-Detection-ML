# Shape-Detection-ML

A MATLAB-based shape detection system that classifies geometric shapes using both supervised learning and feature extraction methods (a bachelors course project 2020).

## Project Overview

This project implements an intelligent shape detection system capable of classifying four different geometric shapes:
- **Square** (مربع - morabaa)
- **Triangle** (مثلث - mosalas)
- **Circle** (دایره)
- **Hexagon** (6 ضلعی - 6 zelii)

## Features

- **Dual Approach**: Implements both supervised learning (Perceptron algorithm) and traditional feature extraction methods
- **Bilingual Support**: Persian text labels for shape classification results
- **Interactive Testing**: GUI-based file selection for testing custom images
- **Robust Preprocessing**: Advanced image processing pipeline including edge detection, noise removal, and morphological operations
- **Real-time Classification**: Immediate results display with shape identification

## How It Works

### Training Phase
1. **Data Collection**: Uses 20 training images (5 images per shape class) from the `trainPic/` folder
2. **Image Preprocessing**:
   - Convert to grayscale
   - Edge detection using Canny algorithm
   - Noise removal and morphological operations
   - Resize to 50x50 pixels
   - Flatten to 2500-dimensional feature vectors
3. **Model Training**: Perceptron learning algorithm with binary encoding for each shape class

### Testing Phase
1. **User Input**: Select any image file through the GUI
2. **Processing**: Apply the same preprocessing pipeline as training
3. **Classification**: Use trained model to classify the shape
4. **Results**: Display classification results with Persian text labels

### Classification Encoding
- Square: `[1 -1 -1 -1]`
- Triangle: `[-1 1 -1 -1]`
- Circle: `[-1 -1 1 -1]`
- Hexagon: `[-1 -1 -1 1]`

## File Structure

```
src code/
├── main.m              # Main execution file
├── getdata.m           # Training data preparation
├── getfeature.m        # Feature extraction implementation
├── removeBack.m        # Background removal utility
├── trainPic/           # Training images directory
│   ├── a1.jpg-a5.jpg   # Square training images
│   ├── b1.jpg-b5.jpg   # Triangle training images
│   ├── c1.jpg-c5.jpg   # Circle training images
│   └── d1.jpg-d6.jpg   # Hexagon training images
└── Untitled.m          # Additional utility file
```

## Requirements

- MATLAB with Image Processing Toolbox
- Computer Vision Toolbox (for region properties)
- Statistics and Machine Learning Toolbox

## Usage

1. Open MATLAB and navigate to the `src code/` directory
2. Run `main.m` to start the shape detection system
3. The system will train on the provided images
4. Select a test image when prompted
5. View the classification results

## Research Context

This project was developed as part of a "Research and presentation methods" course in a Bachelor's program (May 2020). It demonstrates the application of machine learning and computer vision techniques for pattern recognition and shape classification.

## Technical Details

- **Algorithm**: Perceptron learning with binary classification
- **Feature Dimension**: 2500 (50x50 pixel images)
- **Training Samples**: 20 images (5 per class)
- **Image Processing**: Canny edge detection, morphological operations, noise removal
- **Output**: Binary classification with Persian text labels
