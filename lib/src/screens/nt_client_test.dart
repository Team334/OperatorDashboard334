import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../nt_client.dart' as nt;

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
    nt
        .startNtClient(334)
        .then((res) => setState(() => serverMessage = res.message));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Row(children: [
            const Text("Hello"),
            ElevatedButton(
                onPressed: () => {
                      setState(() async => {await nt.startNtClient(334)})
                    },
                child: const Text("World"))
          ]),
          Row(children: [
            const Text("World"),
            ElevatedButton(onPressed: () => {}, child: const Text("World"))
          ])
        ]));
  }
}
