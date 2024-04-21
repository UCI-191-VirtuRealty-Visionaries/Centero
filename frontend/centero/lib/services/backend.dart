import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logging/logging.dart';

class QueuedUserInfo {
  QueuedUserInfo({required this.userid});
  final String userid;
}

class ManagerInfo {
  ManagerInfo({required this.name});
  final String name;
}

class Backend {
  static FirebaseFirestore get firestore {
    return FirebaseFirestore.instance;
  }

  static Logger createLogger(String name) {
    return Logger('Backend.$name');
  }

  static HttpsCallable getEndpoint(String name) {
    return FirebaseFunctions.instance.httpsCallable(name);
  }

  static Future<List<QueuedUserInfo>?> getCallQueue({
    bool logInfo = true,
  }) async {
    final logger = createLogger('CallQueue');

    final fullQueue = await firestore.collection('CallQueue').get();
    final info = fullQueue.docs.map(
      (e) => QueuedUserInfo(
        userid: e.data()['userid'],
      ),
    );

    if (logInfo) {
      logger.info(
        'Found ${fullQueue.size} in queue: $info',
      );
    }

    return List.from(info);
  }

  static Future<void> authenticateManager({
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

  static Future<ManagerInfo> getManagerProfile(String id) async {
    Logger logger = createLogger('ManagerProfile');

    final doc = await firestore.collection('ManagerProfiles').doc(id).get();
    logger.info('Retrieved profile ${doc.id} ${doc.data()}');

    return ManagerInfo(
      name: doc.data()?['name'],
    );
  }

  static Future<List<ManagerInfo>> getAvailableManagers() async {
    Logger logger = createLogger('AvailableManagers');

    final activeCollection = await firestore
        .collection('ActiveManagers')
        .where('status', isNotEqualTo: 'Offline')
        .get();
    final targets = activeCollection.docs.map((e) => e.id);

    logger.info(
      'Found ${activeCollection.size} available: $targets',
    );

    final results = await firestore
        .collection('ManagerProfiles')
        .where(FieldPath.documentId, whereIn: targets)
        .get();

    for (final doc in results.docs) {
      logger.info('Fetched: ${doc.id} ${doc.data()}');
    }

    final info = results.docs.map(
      (e) => ManagerInfo(
        name: e.data()['name'],
      ),
    );

    return List.from(info);
  }

  static Future<void> addManagerToAvailableStaff(String uid) async {
    Logger logger = createLogger('AddManagerToAvailable');

    final response = await getEndpoint('setManagerStatus').call({
      'id': uid,
      'status': 'Online',
    });

    logger.info('Set $uid to Online, result $response');
  }

  static Future<void> removeManagerFromAvailableStaff(String uid) async {
    Logger logger = createLogger('RemoveManagerFromAvailable');

    final response = await getEndpoint('setManagerStatus').call({
      'id': uid,
      'status': 'Offline',
    });

    logger.info('Set $uid to Offline, result $response');
  }
}
