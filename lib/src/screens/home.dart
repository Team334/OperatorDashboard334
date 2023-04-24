import 'package:flutter/material.dart';
import 'package:nt_core/nt_core.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  int count = 0;
  int increment = 1;
  String? platformVersion = "";

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String? a = await NtCore().getPlatformVersion();
    setState(() {
      platformVersion = a;
      print("Version: ");
      print(a);
    });
  }

  void incrementCounter() {
    setState(() {
      count += increment;
    });
  }

  void incrementAdder() {
    setState(() {
      increment++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SelectableText(
            'Button Clicks - $count',
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            style: style,
            onPressed: () => {incrementCounter()},
            child: const Text('Click Me!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50)),
          ),

          const Icon(
              null), // is "const" because value never changes and can be created at compile-time

          // cannot be "const" because uses variables that might be modified during run-time
          ElevatedButton(
            style: style,
            onPressed: () => {incrementAdder()},
            child: const Text('+',
                textAlign: TextAlign.justify,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50)),
          ),
        ],
      ),
    );
  }
}
