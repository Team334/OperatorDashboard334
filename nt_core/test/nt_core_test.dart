import 'package:flutter_test/flutter_test.dart';
import 'package:nt_core/nt_core.dart';
import 'package:nt_core/nt_core_platform_interface.dart';
import 'package:nt_core/nt_core_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockNtCorePlatform
    with MockPlatformInterfaceMixin
    implements NtCorePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final NtCorePlatform initialPlatform = NtCorePlatform.instance;

  test('$MethodChannelNtCore is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelNtCore>());
  });

  test('getPlatformVersion', () async {
    NtCore ntCorePlugin = NtCore();
    MockNtCorePlatform fakePlatform = MockNtCorePlatform();
    NtCorePlatform.instance = fakePlatform;

    expect(await ntCorePlugin.getPlatformVersion(), '42');
  });
}
