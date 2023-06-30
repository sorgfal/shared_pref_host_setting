// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:collection/collection.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shared_pref_host_setting/features/settings/model/host_settings.dart';

class SettingsRepository {
  static const _hostSettingKeys = 'host_settings';
  HostSettings? _settings;
  final _streamController = StreamController<HostSettings>();

  SettingsRepository() {
    getHostSettings();
  }

  Future<HostSettings> getHostSettings() async {
    _settings ??= await SharedPreferences.getInstance().then((sp) {
      var val = sp.getString(_hostSettingKeys);

      var settings = HostSettings.values
          .firstWhereOrNull((element) => element.name == val);
      return settings;
    });
    _settings ??= HostSettings.ru;
    _streamController.add(_settings!);

    return _settings!;
  }

  Future<HostSettings> setHostSettings(HostSettings hostSettings) async {
    await SharedPreferences.getInstance();
    await (await SharedPreferences.getInstance())
        .setString(_hostSettingKeys, hostSettings.name);

    _settings = hostSettings;
    _streamController.add(hostSettings);
    return hostSettings;
  }

  Stream<HostSettings> get settingsStream => _streamController.stream;

  @override
  bool operator ==(covariant SettingsRepository other) {
    if (identical(this, other)) return true;

    return other._settings == _settings;
  }

  @override
  int get hashCode => _settings.hashCode;
}
