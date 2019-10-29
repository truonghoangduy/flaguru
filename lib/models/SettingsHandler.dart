import 'package:flaguru/models/Settings.dart';

import 'LocalStorage.dart';

class SettingsHandler {
  Settings _currentSettings;
  var _localStorage = LocalStorage();

  bool get isSoundEnabled {
    return this._currentSettings.isSoundON;
  }

  set isSoundEnabled(bool newstate) {
    this._currentSettings.isSoundON = newstate;
    _localStorage
        .updateNewSettings(this._currentSettings)
        .catchError((error) => print(error));
  }

  bool get isAudioEnabled {
    return this._currentSettings.isAudioON;
  }

  set isAudioEnabled(bool newstate) {
    this._currentSettings.isAudioON = newstate;
    _localStorage
        .updateNewSettings(this._currentSettings)
        .catchError((error) => print(error));
  }

  bool get skipTutorials {
    return this._currentSettings.skipTutorials;
  }

  set skipTutorials(bool newstate) {
    this._currentSettings.skipTutorials = newstate;
    _localStorage
        .updateNewSettings(this._currentSettings)
        .catchError((error) => print(error));
  }

  SettingsHandler._internal();

  static SettingsHandler settingInstance;

  static Future<SettingsHandler> getInstance() async {
    if (settingInstance == null) {
      settingInstance = SettingsHandler._internal();
      settingInstance._currentSettings =
          await settingInstance._localStorage.getExistingSettings();
    }
    return settingInstance;
  }

  void resetSettings() {
    this._currentSettings.isAudioON = true;
    this._currentSettings.isSoundON = true;
    this._currentSettings.skipTutorials = false;
    this._localStorage.updateNewSettings(this._currentSettings);
  }
}
