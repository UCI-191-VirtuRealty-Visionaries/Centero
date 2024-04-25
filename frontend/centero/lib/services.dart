import 'package:centero/services/backend_service.dart';
import 'package:centero/services/nav_service.dart';

class Services {
  static late final NavService nav;
  static late final BackendService backend;

  static void initialize() {
    nav = NavService();
    backend = BackendService();
  }
}