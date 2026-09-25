import 'package:animation_tut/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomeScreen(),
      ),
    );
  }
}

// Copyright 2020 the Dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license
// that can be found in the LICENSE file.

// import 'dart:math';

// import 'package:flutter/material.dart';

// class DiscData {
//   static final _rng = Random();

//   final double size;
//   final Color color;
//   final Alignment alignment;

//   DiscData()
//       : size = _rng.nextDouble() * 40 + 10,
//         color = Color.fromARGB(
//           _rng.nextInt(200),
//           _rng.nextInt(255),
//           _rng.nextInt(255),
//           _rng.nextInt(255),
//         ),
//         alignment = Alignment(
//           _rng.nextDouble() * 2 - 1,
//           _rng.nextDouble() * 2 - 1,
//         );
// }

// void main() async {
//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.dark(useMaterial3: true),
//       home: Scaffold(
//         body: Container(
//           color: const Color(0xFF15202D),
//           child: const SizedBox.expand(
//             child: VariousDiscs(50),
//           ),
//         ),
//       ),
//     ),
//   );
// }

// class VariousDiscs extends StatefulWidget {
//   final int numberOfDiscs;

//   const VariousDiscs(this.numberOfDiscs, {super.key});

//   @override
//   State<VariousDiscs> createState() => _VariousDiscsState();
// }

// class _VariousDiscsState extends State<VariousDiscs> {
//   final _discs = <DiscData>[];

//   @override
//   void initState() {
//     super.initState();
//     _makeDiscs();
//   }

//   void _makeDiscs() {
//     _discs.clear();
//     for (int i = 0; i < widget.numberOfDiscs; i++) {
//       _discs.add(DiscData());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         const Center(
//           child: Text(
//             'Click a disc!',
//             style: TextStyle(color: Colors.white, fontSize: 50),
//           ),
//         ),
//         GestureDetector(
//           onTap: () => setState(() {
//             _makeDiscs();
//           }),
//           child: Stack(children: [
//             for (final disc in _discs)
//               Positioned.fill(
//                 child: AnimatedAlign(
//                   duration: const Duration(milliseconds: 500),
//                   curve: Curves.easeInOut,
//                   alignment: disc.alignment,
//                   child: AnimatedContainer(
//                     duration: const Duration(milliseconds: 500),
//                     decoration: BoxDecoration(
//                       color: disc.color,
//                       shape: BoxShape.circle,
//                     ),
//                     height: disc.size,
//                     width: disc.size,
//                   ),
//                 ),
//               ),
//           ]),
//         ),
//       ],
//     );
//   }
// }
