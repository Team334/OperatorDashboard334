import 'dart:convert';

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

Future<ServerResponse> startNtClient(int team) async {
  return ServerResponse.fromJson((await http.get(Uri.http(
    'localhost:8000',
    '/startNtClient',
    {"team": team.toString()}
  ))).body);
}

Future<ServerResponse> setTopic<T>(
    String name, T value, ServerType type) async {
  return ServerResponse.fromJson((await http.get(Uri.http(
          'localhost:8000',
          '/setTopic',
          {"value": value, "type": describeEnum(type), "name": name})))
      .body);
}

Future<ServerResponse> getTopic(String name, ServerType type) async {
  return ServerResponse.fromJson(
      (await http.get(Uri.http('localhost:8000', '/getTopic', {
        "name": name,
        "type": describeEnum(type)
      }))).body);
}
