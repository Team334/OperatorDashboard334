#include "include/nt_core/nt_core_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "nt_core_plugin.h"

void NtCorePluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  nt_core::NtCorePlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
