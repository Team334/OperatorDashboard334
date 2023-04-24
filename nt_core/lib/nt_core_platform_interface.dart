import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'nt_core_method_channel.dart';

abstract class NtCorePlatform extends PlatformInterface {
  /// Constructs a NtCorePlatform.
  NtCorePlatform() : super(token: _token);

  static final Object _token = Object();

  static NtCorePlatform _instance = MethodChannelNtCore();

  /// The default instance of [NtCorePlatform] to use.
  ///
  /// Defaults to [MethodChannelNtCore].
  static NtCorePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [NtCorePlatform] when
  /// they register themselves.
  static set instance(NtCorePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    return _instance.getPlatformVersion();
  }
}
