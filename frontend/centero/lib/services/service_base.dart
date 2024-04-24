import 'package:logging/logging.dart';

abstract class ServiceBase {
  final String name;
  late final Logger logger;

  ServiceBase({
    required this.name,
  });

  void initialize() {
    logger = Logger(name);
  }
}
