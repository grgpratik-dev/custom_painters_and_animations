import 'dart:math';

import 'package:animation_tut/custom_painter/custom_painters.dart';
import 'package:flutter/material.dart';

class CustomScreen extends StatefulWidget {
  const CustomScreen({super.key});

  @override
  State<CustomScreen> createState() => _CustomScreenState();
}

class _CustomScreenState extends State<CustomScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 10))
          ..repeat();

    _rotationAnimation =
        Tween<double>(end: 2 * pi, begin: 0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Painter"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: SingleChildScrollView(
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Colors.teal,
                  child: CustomPaint(
                    size: Size(400, 400),
                    painter:
                        CustomPainters(customPainterFor: CustomPainterFor.line),
                  ),
                ),
                Container(
                  color: Colors.black87,
                  child: RotationTransition(
                    turns: _rotationAnimation,
                    child: CustomPaint(
                      size: Size(MediaQuery.sizeOf(context).width, 300),
                      painter: CustomPainters(
                          customPainterFor: CustomPainterFor.pathStar),
                    ),
                  ),
                ),
                Container(
                  color: Colors.deepPurple,
                  child: CustomPaint(
                    size: Size(MediaQuery.sizeOf(context).width, 300),
                    painter: CustomPainters(
                        customPainterFor: CustomPainterFor.pathTraingle),
                  ),
                ),
                Container(
                  // clipBehavior: Clip.hardEdge,
                  color: Colors.red,
                  constraints: BoxConstraints(maxHeight: 400, maxWidth: 400),
                  child: CustomPaint(
                    painter: CustomPainters(
                        customPainterFor: CustomPainterFor.circle),
                    size: Size(MediaQuery.sizeOf(context).width, 200),
                  ),
                ),
                Container(
                  color: Colors.amber,
                  child: CustomPaint(
                    painter:
                        CustomPainters(customPainterFor: CustomPainterFor.oval),
                    size: Size(MediaQuery.sizeOf(context).width, 200),
                  ),
                ),
                Container(
                  color: Colors.pink,
                  child: CustomPaint(
                    size: Size(MediaQuery.sizeOf(context).width, 200),
                    painter: CustomPainters(
                        customPainterFor: CustomPainterFor.rectangle),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
