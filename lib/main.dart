import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_arc_progress_sample/gradient_progress.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const Color progressStart = Color.fromRGBO(229, 251, 95, 1.0);
const Color progressEnd = Color.fromRGBO(2, 127, 217, 1.0);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Arc Progress',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulHookConsumerWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Tween<double> tween;
  final Curve curve = Curves.easeInOut;
  late Animation<double> animation;
  bool isForward = true;

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
      lowerBound: 0.0,
      upperBound: 1.0,
    );
    tween = Tween(begin: 0.0, end: 1.0);
    tween.chain(CurveTween(curve: curve));
    animation = controller.drive(tween);
    controller.value = 0.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Arc Progress'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 200),
            AnimatedBuilder(
                animation: animation,
                builder: (context, _) {
                  return Column(
                    children: [
                      GradientProgress(radius: 300, progress: controller.value),
                      const SizedBox(height: 100),
                      Text(
                        '${(controller.value * 100).round().toString()}%',
                        style: const TextStyle(fontSize: 32),
                      ),
                    ],
                  );
                }),
            const SizedBox(height: 30),
            OutlinedButton(
              child: const Text('Animation'),
              onPressed: () {
                if (isForward) {
                  controller.forward();
                } else {
                  controller.reverse();
                }
              },
            ),
            const SizedBox(height: 30),
            OutlinedButton(
              child: const Text('Reset'),
              onPressed: () {
                controller.reset();
              },
            ),
          ],
        ),
      ),
    );
  }
}
