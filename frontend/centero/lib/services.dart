import 'package:centero/services/backend_service.dart';
import 'package:centero/services/nav_service.dart';
import 'package:centero/services/secrets_service.dart';

class Services {
  static late final NavService nav;
  static late final BackendService backend;
  static late final SecretsService secrets;

  static void initialize() {
    nav = NavService();
    backend = BackendService();
    secrets = SecretsService();

    secrets.initialize();
  }
}
