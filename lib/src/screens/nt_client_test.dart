import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NtClientTest extends StatefulWidget {
  const NtClientTest({super.key});

  @override
  State<NtClientTest> createState() => _NtClientTestState();
}

class _NtClientTestState extends State<NtClientTest> {
  String serverMessage = "";

  @override
  void initState() {
    super.initState();
    http.get(Uri.parse('http://localhost:8000/startNtClient'), headers: {"team": "334"}).then(
      (res) => {
        serverMessage = jsonDecode(res.body)['message']
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(serverMessage);
  }
}
