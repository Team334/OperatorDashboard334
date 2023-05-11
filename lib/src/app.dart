import 'package:flutter/material.dart';
import 'package:operator_dashboard_334/src/screens/home.dart';
import 'package:operator_dashboard_334/src/screens/nt_client_test.dart';

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
        title: const Text(
            'OperatorDashboard334'), // once again, created at compile time
      ),
      body: const NtClientTest(), // can be switched back to "home screen".
    ));
  }
}
