import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

enum ServerType {
  string,
  double,
  int,
  boolean,
  stringArray,
  booleanArray,
  intArray,
  doubleArray
}

class ServerResponse {
  late dynamic data;
  late String message;
  late bool error;

  ServerResponse(this.message, this.error, [this.data]);

  static ServerResponse fromJson(String json) {
    dynamic decoded = jsonDecode(json);
    return ServerResponse(
        decoded["message"], decoded["error"], decoded["data"]);
  }
}

class NtClient {
  static bool started = false;
  static late int pid;

  /// To start the local HTTP NT Client
  static Future<bool> startHttpNt() async {
    try {
      // for windows rn
      Process process = await Process.start("./http_nt/http_nt-win.exe", []);
      pid = process.pid;
      started = true;
      
      return true;
    } catch (_) {
      return false;
    }
  }

  /// To end the local HTTP NT Client
  static Future<void> endHttpNt() async {
    if (started) {
      Process.killPid(pid);
    }
  }

  /// Starts the NT Client on the HTTP Server using these parameters:
  /// team -> The team to connect to.
  static Future<ServerResponse> startNtClient(int team) async {
    return ServerResponse.fromJson((await http.get(Uri.http(
            'localhost:8000', '/startNtClient', {"team": team.toString()})))
        .body);
  }

  /// Set's a Topic on the NT Server using these parameters:
  /// name -> The name of the Topic.
  /// value -> A valid JSON string of the value being set.
  /// type -> The ServerType of this value.
  ///
  /// If the Topic does not exist on the NT Server, then it is created.
  static Future<ServerResponse> setTopic(
      String name, String value, ServerType type) async {
    return ServerResponse.fromJson((await http.get(Uri.http(
            'localhost:8000',
            '/setTopic',
            {"value": value, "type": describeEnum(type), "name": name})))
        .body);
  }

  /// Get's a Topic from the NT Server using these parameters:
  /// name -> The name of the Topic.
  /// type -> The ServerType of the Topic.
  static Future<ServerResponse> getTopic(String name, ServerType type) async {
    ServerResponse res = ServerResponse.fromJson((await http.get(Uri.http(
            'localhost:8000',
            '/getTopic',
            {"name": name, "type": describeEnum(type)})))
        .body);

    return res;
  }
}
