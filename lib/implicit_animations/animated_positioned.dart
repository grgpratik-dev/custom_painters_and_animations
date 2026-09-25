import 'package:animation_tut/custom_painter/custom_screen.dart';
import 'package:animation_tut/spring_like_animation/spring_physic_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class AnimatedPositionedWidget extends ConsumerWidget {
  const AnimatedPositionedWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 24,
      children: [
        Container(
          height: 300,
          width: MediaQuery.sizeOf(context).width,
          color: Colors.green.withValues(alpha: 0.2),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(999)),
              ),
              Text(
                "Peakaboo",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Consumer(
                builder: (context, ref, child) {
                  final showMessage = ref.watch(showMessageProvider);
                  print(showMessage);
                  return AnimatedPositioned(
                    duration: Duration(seconds: 1),
                    curve: showMessage
                        ? Curves.easeInOutCubicEmphasized
                        : Curves.easeInCirc,
                    top: showMessage ? 50 : 125,
                    child: AnimatedContainer(
                      alignment: Alignment.center,
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInOutQuart,
                      height: showMessage ? 70 : 50,
                      width: showMessage ? 140 : 100,
                      decoration: BoxDecoration(
                          color: showMessage
                              ? Colors.deepOrange
                              : Colors.deepOrangeAccent,
                          borderRadius:
                              BorderRadius.circular(showMessage ? 0 : 999)),
                      child: Text(
                        showMessage ? "🎉🎉🎉🎉" : 'Open Me',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: showMessage ? 24 : 16),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
        ElevatedButton(
            onPressed: () {
              ref.read(showMessageProvider.notifier).update((state) => !state);
            },
            child: Text("Click to open / close")),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SpringPhysicAnimation(),
                  ));
            },
            child: Text("Go To Spring Physics Animation")),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomScreen(),
                  ));
            },
            child: Text("Go to custom Painter Screen")),
      ],
    );
  }
}

StateProvider<bool> showMessageProvider = StateProvider<bool>((ref) => false);
