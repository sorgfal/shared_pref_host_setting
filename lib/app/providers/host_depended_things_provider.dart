import 'package:flutter/material.dart';
import 'package:shared_pref_host_setting/common/api/api_client.dart';
import 'package:shared_pref_host_setting/features/settings/model/host_settings.dart';

class HostDependedThingsProvider extends InheritedWidget {
  final HostSettings? hostSettings;
  const HostDependedThingsProvider(this.hostSettings,
      {super.key, required this.child})
      : super(child: child);

  final Widget child;

  ApiClient? get apiClient =>
      hostSettings != null ? ApiClient(hostSettings!.apiHost) : null;

  static HostDependedThingsProvider? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<HostDependedThingsProvider>();
  }

  static HostDependedThingsProvider? get(BuildContext context) {
    return context.getInheritedWidgetOfExactType<HostDependedThingsProvider>();
  }

  @override
  bool updateShouldNotify(HostDependedThingsProvider oldWidget) {
    return oldWidget.hostSettings != hostSettings;
  }
}
