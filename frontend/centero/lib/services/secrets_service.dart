import 'dart:convert';

import 'package:centero/global_config.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

class SecretsService {
  final _logger = Logger('Service.Secrets');
  late final List<int> _hmacKey;

  Future<void> _initDevMode() async {
    _hmacKey = utf8.encode('debug_key');
  }

  Future<void> _initProdMode() async {
    try {
      final inStr =
          await rootBundle.loadString('secrets/prod_hashkey', cache: false);
      _hmacKey = utf8.encode(inStr);
    } catch (err) {
      _logger.shout(
          'Could not load prod_hashkey, disabling login to prevent data leakage');
      _hmacKey = utf8.encode('err_key');
    }
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
