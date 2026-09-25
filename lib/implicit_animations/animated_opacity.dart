import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class AnimatedOpacityWidget extends ConsumerStatefulWidget {
  const AnimatedOpacityWidget({super.key});

  @override
  ConsumerState<AnimatedOpacityWidget> createState() =>
      _AnimatedOpacityWidgetState();
}

class _AnimatedOpacityWidgetState extends ConsumerState<AnimatedOpacityWidget> {
  final StreamController<double> streamController = StreamController<double>();
  @override
  void initState() {
    super.initState();

    addValueInStream();
    streamController.stream.listen(
      (event) {
        ref.read(progressProvider.notifier).update(
              (state) => state.copyWith(progress: event),
            );
      },
    );
  }

  void addValueInStream() async {
    for (int i = 0; i <= 10; i++) {
      await Future.delayed(Duration(milliseconds: 150));
      streamController.sink.add((i / 10));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final progressState = ref.watch(progressProvider);
        return AnimatedOpacity(
          opacity: progressState.progress,
          duration: Duration(milliseconds: 200),
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }
}

StateProvider<ProgressState> progressProvider = StateProvider<ProgressState>(
  (ref) => ProgressState(),
);

class ProgressState {
  final double progress;
  ProgressState({this.progress = 0.0});

  ProgressState copyWith({double? progress}) => ProgressState(
        progress: progress ?? this.progress,
      );
}
