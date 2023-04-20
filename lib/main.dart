import 'package:flutter/material.dart';

void main() {
  /**
   * const keyword -> create instance of object during COMPILE time,
   * and explicitly state that the object cannot change at all during RUN time
   */
  runApp(const OperatorDashboard334());
}

class OperatorDashboard334 extends StatelessWidget {
  /**
   * const keyword in constructor -> explicitly state that this class
   * is going to be constant and created during COMPILE time
   * also all "OperatorDashboard334" instances are going to have the same
   * memory location and hashcode
   */
  const OperatorDashboard334({super.key});

  @override
  Widget build(BuildContext context) {
    // Material App
    return MaterialApp(
        // Scaffold Widget
        home: Scaffold(
        appBar: AppBar(
        // AppBar takes a Text Widget in it's title parameter
        title: const Text('OperatorDashboard334'), // once again, created at compile time
      ),
      body: const MyStatefulWidget(),
    ));
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int count = 0;
  int increment = 1;

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
    final ButtonStyle style = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

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
            onPressed: () => { incrementCounter() },
            child: const Text('Click Me!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50)),
          ),
          
          const Icon(null), // is "const" because value never changes and can be created at compile-time

          // cannot be "const" because uses variables that might be modified during run-time
          ElevatedButton(
            style: style,
            onPressed: () => { incrementAdder()} ,
            child: const Text('+',
                textAlign: TextAlign.justify,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50)),
          ),
        ],
      ),
    );
  }
}
