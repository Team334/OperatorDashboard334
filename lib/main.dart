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
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ElevatedButton(
            style: style,
            onPressed: null,
            child: const Text('Disabled'),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: style,
            onPressed: () {},
            child: const Text('Enabled'),
          ),
        ],
      ),
    );
  }
}

