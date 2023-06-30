import 'package:flutter/material.dart';
import 'package:shared_pref_host_setting/features/settings/repository/setting_repository.dart';

class RootProvider extends InheritedWidget {
  late final SettingsRepository settingsRepository;
  RootProvider({super.key, required this.child}) : super(child: child) {
    settingsRepository = SettingsRepository();
  }
  final Widget child;

  static RootProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<RootProvider>();
  }

  static RootProvider? get(BuildContext context) {
    return context.getInheritedWidgetOfExactType<RootProvider>();
  }

  @override
  bool updateShouldNotify(RootProvider oldWidget) {
    return settingsRepository != oldWidget.settingsRepository;
  }
}
