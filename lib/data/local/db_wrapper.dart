import 'package:get/get.dart';

import 'local.dart';

class DBWrapper {
  Future<void> init() async => await _preference.init();

  final _preference = Get.find<SharedPreferencesManager>();

  void clearData(String key) => _preference.delete(key);

  /// Delete the box
  void deleteBox() => _preference.clear();

  /// Returns stored string value
  String getStringValue(String key, {String defaultValue = ''}) =>
      _preference.getStringValue(key, defaultValue);

  /// store the data
  void saveValue<T>(String key, T value) =>
      _preference.saveSharedValue(key, value);

  /// return bool value
  bool getBoolValue(String key, {bool defaultValue = false}) =>
      _preference.getBoolValue(key, defaultValue);

  /// return bool value
  int getIntValue(String key, {int defaultValue = 0}) =>
      _preference.getIntValue(key, defaultValue);
}
