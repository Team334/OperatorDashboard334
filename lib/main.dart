import 'package:flutter/material.dart';

void main() {
  runApp(const OperatorDashboard334());
}

class OperatorDashboard334 extends StatelessWidget {
  const OperatorDashboard334({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Material App
    return MaterialApp(

        // Scaffold Widget
        home: Scaffold(
      appBar: AppBar(
        // AppBar takes a Text Widget in it's title parameter
        title: const Text('OperatorDashboard334'),
      ),
      body: const Center(child: Text('Hello from 334!')),
    ));
  }
}
