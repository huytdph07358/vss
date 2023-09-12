import 'dart:async';

import 'package:nb_utils/nb_utils.dart';

import 'environment_enum.dart';

class EnvironmentSwitch {
  static const String _environmentSharePrefKey =
      'vss_environment.EnvironmentSwitch._environmentSharePrefKey';
  static String _environment = getStringAsync(_environmentSharePrefKey,
      defaultValue: EnvironmentEnum.live.env); //TODO:BUILD_ENV

  static String get environment => _environment;

  static final StreamController<String> _environmentStreamController =
      StreamController<String>.broadcast();

  static Stream<String> get environmentStream =>
      _environmentStreamController.stream;

  static void setEnvironment(String value) {
    setValue(_environmentSharePrefKey, value);
    _environmentStreamController.sink.add(value);
    _environment = value;
  }
}
