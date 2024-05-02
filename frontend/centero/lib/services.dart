import 'package:centero/services/backend_service.dart';
import 'package:centero/services/nav_service.dart';
import 'package:centero/services/secrets_service.dart';

class Services {
  static late final NavService nav;
  static late final BackendService backend;
  static late final SecretsService secrets;
  static bool _initialized = false;

  static void initialize() {
    if (_initialized) {
      return;
    }

    nav = NavService();
    backend = BackendService();
    secrets = SecretsService();

    secrets.initialize();
    _initialized = true;
  }
}
