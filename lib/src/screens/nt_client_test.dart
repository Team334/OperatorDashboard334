import 'dart:convert';

import 'package:flutter/material.dart';
import '../nt_client.dart';

class NtClientTest extends StatefulWidget {
  const NtClientTest({super.key});

  @override
  State<NtClientTest> createState() => _NtClientTestState();
}

class _NtClientTestState extends State<NtClientTest> {
  ServerResponse serverRes = ServerResponse("", false);
  String serverData = "NONE";

  ServerType setValType = ServerType.string;
  ServerType getValType = ServerType.string;

  String setTopicValue = "";

  String setTopicName = "";
  String getTopicName = "";

  int messageNum = 0;

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
                  ServerResponse res = await NtClient.startNtClient(334);
                  setState(() {
                    serverRes = res;
                    serverData = "NONE";
                    messageNum++;
                  });
                },
                child: const Text("Click Me!"))
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
            SizedBox(
                width: 200,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Topic Name',
                  ),
                  onChanged: (String name) {
                    setTopicName = name;
                  },
                )),
            SizedBox(
                width: 200,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Topic Value',
                  ),
                  onChanged: (String value) {
                    setTopicValue = value;
                  },
                )),
            ElevatedButton(
                onPressed: () async {
                  ServerResponse res = await NtClient.setTopic(
                      setTopicName, setTopicValue, setValType);
                  setState(() {
                    serverRes = res;
                    serverData = "NONE";
                    messageNum++;
                  });
                },
                child: const Text("Click Me!"))
          ]),
          Row(
            children: [
              const Text("Get Topic"),
              DropdownButton<ServerType>(
                  value: setValType,
                  items: ServerType.values.map((ServerType type) {
                    return DropdownMenuItem<ServerType>(
                        value: type, child: Text(type.toString()));
                  }).toList(),
                  onChanged: (ServerType? type) {
                    setState(() {
                      if (type != null) {
                        getValType = type;
                      }
                    });
                  }),
              SizedBox(
                width: 200,
                child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Topic Name',
                    ),
                    onChanged: (String name) {
                      getTopicName = name;
                    }),
              ),
              ElevatedButton(
                child: const Text("Click Me!"),
                onPressed: () async {
                  ServerResponse res =
                      await NtClient.getTopic(getTopicName, getValType);
                  setState(() {
                    serverRes = res;
                    serverData = jsonEncode(
                        res.data); // encode back into string for print
                    messageNum++;
                  });
                },
              )
            ],
          ),
          Row(children: [Text("Server Message: ${serverRes.message}")]),
          Row(children: [Text("Server Data: $serverData")]),
          Row(children: [Text("Message #: ${messageNum.toString()}")])
        ]));
  }
}
