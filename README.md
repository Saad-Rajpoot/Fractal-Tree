# Fractal Tree in Flutter

Welcome to the Fractal Tree Flutter project! This project demonstrates how to create beautiful and interactive fractal tree patterns using Flutter's powerful drawing capabilities. Whether you're an experienced developer or just starting out, this project offers a fun and educational way to explore Flutter's custom painting and UI design features.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
- [Usage](#usage)
    - [Adjusting Parameters](#adjusting-parameters)
- [Code Overview](#code-overview)
    - [Main Widgets](#main-widgets)
    - [Customization](#customization)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Introduction

A fractal tree is a recursive geometric figure that mimics the branching structure of a tree. Each branch splits into smaller branches, creating a self-similar pattern that can be both complex and beautiful. This Flutter project recreates the fractal tree experience, allowing users to generate and manipulate these intricate patterns through an intuitive mobile interface.

## Features

- **Interactive UI:** Use sliders to adjust the parameters and watch the tree grow and transform in real-time.
- **Customizable Designs:** Change angles, branch lengths, and recursion depth to create a variety of fractal tree patterns.
- **Responsive Layout:** The app adapts seamlessly to different screen sizes and orientations, ensuring a consistent and engaging experience.
- **Smooth Animations:** Enjoy fluid transitions as you tweak parameters and see the tree evolve instantly.
- **Educational Value:** A great tool for learning about recursion, geometry, and the beauty of fractal mathematics.

## Getting Started

### Prerequisites

Before you begin, ensure you have the following installed on your local machine:

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Dart](https://dart.dev/get-dart)

### Installation

1. **Clone the repository:**

    ```bash
    git clone https://github.com/Saad-Rajpoot/Fractal-Tree.git
    cd Fractal-Tree
    ```

2. **Install dependencies:**

    ```bash
    flutter pub get
    ```

3. **Run the app:**

    ```bash
    flutter run
    ```

## Usage

After running the app, you will see a fractal tree pattern displayed on the screen. Use the slider at the bottom to adjust the parameters and explore different designs.

### Adjusting Parameters

- **Angle:** Controls the angle between branches.
- **Branch Length:** Controls the length of each branch.
- **Recursion Depth:** Controls how many times the branches split.

## Code Overview

### Main Widgets

- **FractalTreeDemo:** This is the main widget containing the UI elements, including the slider and the CustomPaint widget.
- **FractalTreePainter:** A custom painter class responsible for drawing the fractal tree pattern on the canvas.

Here is an example of the `FractalTreePainter` class:

```dart
class FractalTreePainter extends CustomPainter {
  final double angle;
  final double length;
  final int depth;

  FractalTreePainter({required this.angle, required this.length, required this.depth});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    _drawBranch(canvas, paint, size.width / 2, size.height, -pi / 2, length, depth);
  }

  void _drawBranch(Canvas canvas, Paint paint, double x, double y, double angle, double length, int depth) {
    if (depth == 0) return;

    final xEnd = x + length * cos(angle);
    final yEnd = y + length * sin(angle);

    canvas.drawLine(Offset(x, y), Offset(xEnd, yEnd), paint);

    _drawBranch(canvas, paint, xEnd, yEnd, angle - this.angle, length * 0.67, depth - 1);
    _drawBranch(canvas, paint, xEnd, yEnd, angle + this.angle, length * 0.67, depth - 1);
  }

  @override
  bool shouldRepaint(FractalTreePainter oldDelegate) {
    return oldDelegate.angle != angle || oldDelegate.length != length || oldDelegate.depth != depth;
  }
}
```

### Customization

You can modify the `FractalTreePainter` class to change how the fractal tree is drawn. Adjust the parameters like `angle`, `length`, and `depth` to see different patterns. Here's how you might do it:

```dart
class FractalTreePainter extends CustomPainter {
  final double angle;
  final double length;
  final int depth;

  FractalTreePainter({required this.angle, required this.length, required this.depth});

  @override
  void paint(Canvas canvas, Size size) {
    // Drawing logic
  }

  @override
  bool shouldRepaint(FractalTreePainter oldDelegate) {
    return oldDelegate.angle != angle || oldDelegate.length != length || oldDelegate.depth != depth;
  }
}
```

## Contributing

Contributions are welcome! Feel free to open an issue or submit a pull request. For major changes, please open an issue first to discuss what you would like to change.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

If you have any questions or suggestions, feel free to reach out:

- Email: saadi47123@gmail.com
- GitHub: [Saad-Rajpoot](https://github.com/Saad-Rajpoot)
- LinkedIn: [Saad Rajpoot](https://www.linkedin.com/in/saad-rajpoot-b3ba85225/)

Thank you for checking out the Fractal Tree Flutter project! Enjoy creating your own unique patterns and feel free to share your creations with the community.