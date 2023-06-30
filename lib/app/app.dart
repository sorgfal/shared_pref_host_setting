import 'package:flutter/material.dart';
import 'package:shared_pref_host_setting/app/providers/injection_widget.dart';
import 'package:shared_pref_host_setting/features/ui/settings_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const InjectionWidget(
        child: MaterialApp(
      home: SettingsScreen(),
    ));
  }
}
