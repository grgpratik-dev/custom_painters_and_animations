import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class AnimatedContainerWidget extends ConsumerWidget {
  const AnimatedContainerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      spacing: 24,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Consumer(
          builder: (context, ref, child) {
            final containerProperties = ref.watch(containerPropertiesProvider);
            return AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.easeInOutQuart,
              height: containerProperties.height,
              width: containerProperties.width,
              decoration: BoxDecoration(
                color: containerProperties.color,
                borderRadius: BorderRadius.circular(containerProperties.radius),
              ),
            );
          },
        ),
        ElevatedButton(
            onPressed: () {
              ref.read(containerPropertiesProvider.notifier).update(
                    (state) => state.copyWith(
                      height: generateRandomHeightAndWidth(),
                      width: generateRandomHeightAndWidth(),
                      color: generateRandomColor(),
                      radius: generateRandomRadius(),
                    ),
                  );
            },
            child: Text("Next")),
      ],
    );
  }
}

StateProvider<ContainerPropertyState> containerPropertiesProvider =
    StateProvider((ref) => ContainerPropertyState());

class ContainerPropertyState {
  final double height;
  final double width;
  final Color color;
  final double radius;

  ContainerPropertyState({
    this.height = 100,
    this.width = 100,
    this.color = Colors.pink,
    this.radius = 0.0,
  });

  ContainerPropertyState copyWith(
          {double? height, double? width, Color? color, double? radius}) =>
      ContainerPropertyState(
        height: height ?? this.height,
        width: width ?? this.width,
        color: color ?? this.color,
        radius: radius ?? this.radius,
      );
}

double generateRandomHeightAndWidth() {
  final random = Random();
  return random.nextDouble() * 400;
}

double generateRandomRadius() {
  final random = Random();
  return random.nextDouble() * 100;
}

Color generateRandomColor() {
  final random = Random();
  return Color.fromARGB(
    255,
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
  );
}
