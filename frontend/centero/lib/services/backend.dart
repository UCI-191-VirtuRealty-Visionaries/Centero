import 'dart:convert';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logging/logging.dart';

class QueuedUserInfo {
  final String userid;

  QueuedUserInfo({required this.userid});
}

class Backend {
  static Logger createLogger(String name) {
    return Logger('Backend.$name');
  }

  static HttpsCallable getEndpoint(String name) {
    return FirebaseFunctions.instance.httpsCallable(name);
  }

  static Future<List<QueuedUserInfo>?> getCallQueue({
    bool silent = false,
  }) async {
    final logger = createLogger('CallQueue');

    try {
      final response = await getEndpoint('getQueue').call();
      final docs = response.data['docs'];
      if (!silent) {
        logger.info('Fetched call queue ${docs.toString()}');
      }

      List<QueuedUserInfo> ret = [];
      for (var doc in docs) {
        ret.add(QueuedUserInfo(
          userid: doc['userid'],
        ));
      }
      return ret;
    } on FirebaseFunctionsException catch (ferr) {
      logger.severe(ferr);
      return null;
    } catch (error) {
      logger.severe(error);
      return null;
    }
  }

  static Future<void> authManager({
    required String company,
    required String username,
    required String password,
  }) async {
    final logger = createLogger('AuthManager');

    final digest = sha256.convert(utf8.encode(password));
    logger.info('Logging in with `$company : $username : $digest`');

    try {
      final response = await getEndpoint('authManager').call(
        {
          'company': company,
          'id': username,
          'hash': digest.toString(),
        },
      );

      bool success = response.data['success'];

      if (success) {
        String token = response.data['token'];
        final credential =
            await FirebaseAuth.instance.signInWithCustomToken(token);

        logger.info('Successful login. ${credential.user}');
      } else {
        logger.severe('Failed to log in as $username, credentials refused.');
      }
    } catch (error) {
      logger.severe(error);
    }
  }
}
