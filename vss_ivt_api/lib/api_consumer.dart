import 'dot_net_api.dart';
import 'dot_net_core_api.dart';

typedef UnAuthorizeCallback = Future<void> Function();

class ApiConsumer {
  static String applicationCode = '';
  static String appVersion = '';
  static UnAuthorizeCallback? onUnAuthorizeCallback;

  static final DotNetApi dotNetApi =
      DotNetApi(applicationCode: applicationCode);
  static final DotNetCoreApi dotNetCoreApi =
      DotNetCoreApi(applicationCode: applicationCode);

  static void setApplicationCode(String _applicationCode) {
    applicationCode = _applicationCode;
  }

  static void setVersion(String _appVersion) {
    appVersion = _appVersion;
  }

  static void updateToken(String tokenCode) {
    dotNetApi.tokenCode = tokenCode;
    dotNetCoreApi.tokenCode = tokenCode;
  }

  static void updateLanguage(String languageCode) {
    dotNetApi.languageCode = languageCode;
    dotNetCoreApi.languageCode = languageCode;
  }

  static void setUnAuthorizeCallback(
      UnAuthorizeCallback? _onUnAuthorizeCallback) {
    onUnAuthorizeCallback = _onUnAuthorizeCallback;
  }
}
