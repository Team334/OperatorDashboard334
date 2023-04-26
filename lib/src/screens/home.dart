import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';
import 'package:path/path.dart' as p;
import 'package:flutter/material.dart';
import 'nt_bindings.dart' as nt;

final ntcore = nt.NativeLibrary(DynamicLibrary.open(_getPath()));

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  int _count = 0;
  int _increment = 1;

  final _networkTablesInst = ntcore.NT_GetDefaultInstance();

  @override
  void initState() {
    super.initState();
    ntcore.NT_StartServer(
        _networkTablesInst,
        "".toNativeUtf8().cast<Char>(),
        "".toNativeUtf8().cast<Char>(),
        nt.NT_DEFAULT_PORT3,
        nt.NT_DEFAULT_PORT4);
  }

  void incrementCounter() {
    setState(() {
      _count += _increment;
    });
  }

  void incrementAdder() {
    setState(() {
      _increment++;
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
            'Button Clicks - $_count',
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

String _getPath() {
  var path = Directory.current.absolute.path;
  if (Platform.isMacOS) {
    path = p.join(path, 'libntcore.dylib');
  } else if (Platform.isWindows) {
    path = p.join(path, 'libntcore.dll');
  } else if (Platform.isLinux) {
    path = p.join(path, 'libntcore.so');
  }
  return path;
}
