#ifndef FLUTTER_PLUGIN_NT_CORE_PLUGIN_H_
#define FLUTTER_PLUGIN_NT_CORE_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace nt_core {

class NtCorePlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  NtCorePlugin();

  virtual ~NtCorePlugin();

  // Disallow copy and assign.
  NtCorePlugin(const NtCorePlugin&) = delete;
  NtCorePlugin& operator=(const NtCorePlugin&) = delete;

 // gets overriden
 private:
  std::string getPlatformVersion();

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace nt_core

#endif  // FLUTTER_PLUGIN_NT_CORE_PLUGIN_H_
