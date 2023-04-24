
import 'nt_core_platform_interface.dart';

class NtCore {
  Future<String?> getPlatformVersion() {
    return NtCorePlatform.instance.getPlatformVersion();
  }
}
