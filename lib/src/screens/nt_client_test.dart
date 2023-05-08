import 'package:flutter/material.dart';
import '../nt_client.dart' as nt;

class NtClientTest extends StatefulWidget {
  const NtClientTest({super.key});

  @override
  State<NtClientTest> createState() => _NtClientTestState();
}

class _NtClientTestState extends State<NtClientTest> {
  nt.ServerResponse serverRes = nt.ServerResponse("", false);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Row(children: [
            const Text("Start NT Client"),
            ElevatedButton(
                onPressed: () async {
                  nt.ServerResponse res = await nt.startNtClient(334);
                  setState(() => serverRes = res);
                },
                child: const Text("Click Me!")),
            Text(serverRes.message),
          ]),
          Row(children: [
            const Text("Set Topic"),
            DropdownButton(
                items: nt.ServerType.values.map((nt.ServerType type) {
                  return DropdownMenuItem(
                      value: type, child: Text(type.toString()));
                }).toList(),
                onChanged: (nt.ServerType? type) {}),
            ElevatedButton(
                onPressed: () async {
                  nt.ServerResponse res =
                      await nt.setTopic("", "", nt.ServerType.string);
                },
                child: const Text("Click Me!"))
          ])
        ]));
  }
}
