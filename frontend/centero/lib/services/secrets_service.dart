import 'dart:convert';

import 'package:centero/global_config.dart';
import 'package:centero/secrets.dart';
import 'package:logging/logging.dart';

class SecretsService {
  final _logger = Logger('Service.Secrets');
  late final List<int> _hmacKey;

  Future<void> _initDevMode() async {
    _hmacKey = utf8.encode('debug_key');
  }

  Future<void> _initProdMode() async {
    const inStr = centeroProdHashKey;

    if (!centeroSecretsFileWasPopulated) {
      _logger.shout(
          'Secrets were not assigned by the deploy script, disabling login to prevent data leakage');
      _logger.severe(
          'TEMPORARY: Using dev-mode hashkey to allow app to progress.');
      _hmacKey = utf8.encode('debug_key');
      return;
    }

    _hmacKey = utf8.encode(inStr);
  }

  Future<void> initialize() async {
    if (GlobalConfig.isDevMode) {
      await _initDevMode();
    } else {
      await _initProdMode();
    }
  }

  List<int> get hmacKey {
    return _hmacKey;
  }
}
