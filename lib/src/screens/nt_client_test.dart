import 'package:flutter/material.dart';
import '../nt_client.dart';

class NtClientTest extends StatefulWidget {
  const NtClientTest({super.key});

  @override
  State<NtClientTest> createState() => _NtClientTestState();
}

class _NtClientTestState extends State<NtClientTest> {
  ServerResponse serverRes = ServerResponse("", false);

  ServerType setValType = ServerType.string;
  ServerType getValType = ServerType.string;

  String setTopicName = "";
  String getTopicName = "";

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
                  ServerResponse res = await NTClient.startNtClient(334);
                  setState(() => serverRes = res);
                },
                child: const Text("Click Me!")),
            Text(serverRes.message),
          ]),
          Row(children: [
            const Text("Set Topic"),
            DropdownButton<ServerType>(
                value: setValType,
                items: ServerType.values.map((ServerType type) {
                  return DropdownMenuItem<ServerType>(
                      value: type, child: Text(type.toString()));
                }).toList(),
                onChanged: (ServerType? type) {
                  setState(() {
                    if (type != null) {
                      setValType = type;
                    }
                  });
                }),
            ElevatedButton(
                onPressed: () async {
                  ServerResponse res =
                      await NTClient.setTopic(setTopicName, "", setValType);
                  setState(() => serverRes = res);
                },
                child: const Text("Click Me!"))
          ]),
          Row(
            children: [
              const Text("Get Topic"),
              // TextFormField(
              //   decoration: const InputDecoration(
              //     border: UnderlineInputBorder(),
              //     labelText: 'Topic Name',
              //   ),
              //   onChanged: (String name) {
              //     topicName = name;
              //   },
              // ),
              ElevatedButton(
                child: const Text("Click Me!"),
                onPressed: () async {
                  ServerResponse res =
                      await NTClient.getTopic(getTopicName, getValType);
                  setState(() => serverRes = res);
                },
              )
            ],
          )
        ]));
  }
}
