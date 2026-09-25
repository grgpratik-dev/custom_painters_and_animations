import 'package:animation_tut/implicit_animations/animated_positioned.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Implicit Animation"),
        centerTitle: true,
      ),
      body: AnimatedPositionedWidget(),
    );
  }
}
