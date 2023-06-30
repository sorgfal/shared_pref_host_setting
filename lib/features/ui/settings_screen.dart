import 'package:flutter/material.dart';
import 'package:shared_pref_host_setting/app/providers/host_depended_things_provider.dart';
import 'package:shared_pref_host_setting/app/providers/root_provider.dart';
import 'package:shared_pref_host_setting/features/settings/model/host_settings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var host = HostDependedThingsProvider.of(context)?.hostSettings;
    return Scaffold(
      appBar: AppBar(
        title: Text('Настройки'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Настройки УРЛА'),
            subtitle: Text(host?.apiHost ?? "null"),
          ),
          ExpansionTile(title: Text('Настройка хоста'), children: [
            for (var h in HostSettings.values)
              RadioListTile(
                groupValue: host,
                value: h,
                title: Text(h.apiHost),
                onChanged: (value) {
                  RootProvider.get(context)
                      ?.settingsRepository
                      .setHostSettings(h);
                },
              ),
          ]),
        ],
      ),
    );
  }
}
