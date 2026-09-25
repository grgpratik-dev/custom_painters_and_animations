import 'package:flutter/material.dart';

class SpringPhysicAnimation extends StatefulWidget {
  const SpringPhysicAnimation({super.key});

  @override
  State<SpringPhysicAnimation> createState() => _SpringPhysicAnimationState();
}

class _SpringPhysicAnimationState extends State<SpringPhysicAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    )..forward();

    _animation = Tween<double>(begin: -600, end: 0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    ));
  }

  void _startAnimation() {
    _animationController.reset();
    _animationController.forward();
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
        title: Text("Spring Physic Animation"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            _startAnimation();
          },
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _animation.value),
                child: child,
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.cyan,
              ),
              child: Text(
                "Animate Me",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
