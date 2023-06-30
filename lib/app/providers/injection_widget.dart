import 'package:flutter/material.dart';
import 'package:shared_pref_host_setting/app/providers/host_depended_things_provider.dart';
import 'package:shared_pref_host_setting/app/providers/root_provider.dart';
import 'package:shared_pref_host_setting/features/settings/model/host_settings.dart';

class InjectionWidget extends StatelessWidget {
  final Widget child;
  const InjectionWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return RootProvider(child: Builder(builder: (context) {
      return Builder(builder: (context) {
        return StreamBuilder<HostSettings>(
            stream: RootProvider.of(context)?.settingsRepository.settingsStream,
            builder: (context, snapshot) {
              print(snapshot);
              return HostDependedThingsProvider(snapshot.data, child: child);
            });
      });
    }));
  }
}
