import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fractal Tree',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Fractal Tree'),
          actions: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: Image.asset(
                  'assets/image.jpg',
                  fit: BoxFit.cover,
                  width: 50,
                  height: 50,
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FractalTreeDemo(),
        ),
      ),
    );
  }
}

class FractalTreeDemo extends StatefulWidget {
  @override
  _FractalTreeDemoState createState() => _FractalTreeDemoState();
}

class _FractalTreeDemoState extends State<FractalTreeDemo> {
  double _angle = pi / 4;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CustomPaint(
            painter: FractalTreePainter(angle: _angle),
            child: Center(),
          ),
        ),
        Slider(
          min: 0,
          max: pi / 2,
          divisions: 100,
          label: 'Angle: ${(_angle * 180 / pi).toStringAsFixed(1)}°',
          value: _angle,
          onChanged: (value) {
            setState(() {
              _angle = value;
            });
          },
        ),
      ],
    );
  }
}

class FractalTreePainter extends CustomPainter {
  final double angle;

  FractalTreePainter({required this.angle});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 2.0;

    final height = size.height;
    final width = size.width;
    final startX = width / 2;
    final startY = height;

    _drawBranch(canvas, startX, startY, -pi / 2, height / 3, paint);
  }

  void _drawBranch(Canvas canvas, double x, double y, double direction, double length, Paint paint) {
    if (length < 2) return;

    final endX = x + length * cos(direction);
    final endY = y + length * sin(direction);

    canvas.drawLine(Offset(x, y), Offset(endX, endY), paint);

    _drawBranch(canvas, endX, endY, direction - angle, length * 0.67, paint);
    _drawBranch(canvas, endX, endY, direction + angle, length * 0.67, paint);
  }

  @override
  bool shouldRepaint(FractalTreePainter oldDelegate) {
    return oldDelegate.angle != angle;
  }
}

