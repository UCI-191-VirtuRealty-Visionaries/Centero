import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logging/logging.dart';

// ==================================================
// Exported Types
// ==================================================

class QueuedUserInfo {
  QueuedUserInfo({required this.userid});
  final String userid;
}

class ResidentInfo {
  ResidentInfo({required this.name, required this.property, required this.unitNumber});

  final String name;
  final String property;
  final String unitNumber;
}

class ManagerInfo {
  ManagerInfo({required this.name});
  final String name;
}

// ==================================================
// Backend
// ==================================================

class Backend {
  // ==================================================
  // Utilities
  // ==================================================

  static FirebaseFirestore get firestore {
    return FirebaseFirestore.instance;
  }

  static Logger createLogger(String name) {
    return Logger('Backend.$name');
  }

  static HttpsCallable getEndpoint(String name) {
    return FirebaseFunctions.instance.httpsCallable(name);
  }

  // ==================================================
  // Profile Fetch
  // ==================================================

  static Future<ResidentInfo> getResidentProfile(String id) async {
    Logger logger = createLogger('ResidentProfile');

    final doc = await firestore.collection('ResidentProfiles').doc(id).get();
    logger.fine('Retrieved profile ${doc.id} ${doc.data()}');

    final data = doc.data();

    return ResidentInfo(
      name: data?['name'],
      property: data?['property'],
      unitNumber: data?['unitNumber'],
    );
  }

  static Future<ManagerInfo> getManagerProfile(String id) async {
    Logger logger = createLogger('ManagerProfile');

    final doc = await firestore.collection('ManagerProfiles').doc(id).get();
    logger.fine('Retrieved profile ${doc.id} ${doc.data()}');

    return ManagerInfo(
      name: doc.data()?['name'],
    );
  }

  // ==================================================
  // Call Queue
  // ==================================================

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
      logger.fine(
        'Found ${fullQueue.size} in queue: $info',
      );
    }

    return List.from(info);
  }

  // ==================================================
  // Available Managers
  // ==================================================

  static Future<List<ManagerInfo>> getAvailableManagers() async {
    Logger logger = createLogger('AvailableManagers');

    final activeCollection = await firestore
        .collection('ActiveManagers')
        .where('status', isNotEqualTo: 'Offline')
        .get();
    final targets = activeCollection.docs.map((e) => e.id);

    logger.fine(
      'Found ${activeCollection.size} available: $targets',
    );

    final results = await firestore
        .collection('ManagerProfiles')
        .where(FieldPath.documentId, whereIn: targets)
        .get();

    for (final doc in results.docs) {
      logger.fine('Fetched: ${doc.id} ${doc.data()}');
    }

    final info = results.docs.map(
      (e) => ManagerInfo(
        name: e.data()['name'],
      ),
    );

    return List.from(info);
  }

  static Future<int> getAvailableManagersCount() async {
    Logger logger = createLogger('AvailableManagersCount');

    final activeCollection = await firestore
        .collection('ActiveManagers')
        .where('status', isNotEqualTo: 'Offline')
        .get();
    
    logger.fine('Retrieved collection $activeCollection');

    return activeCollection.size;
  }

  // ==================================================
  // Authentication
  // ==================================================

  static Future<void> authenticateResidentManual({
    required String username,
    required String password,
  }) async {
    final logger = createLogger('AuthResident.Manual');

    final digest = sha256.convert(utf8.encode(password));
    logger.info('Logging in with `$username : $digest`');

    try {
      final response = await getEndpoint('authResidentManual').call(
        {
          'username': username,
          'passwordHash': digest.toString(),
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
      logger.severe('Generic error $error');
    }
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
          'username': username,
          'passwordHash': digest.toString(),
        },
      );

      bool success = response.data['success'];

      if (success) {
        String token = response.data['token'];
        final credential =
            await FirebaseAuth.instance.signInWithCustomToken(token);

        logger.info('Successful login. ${credential.user}');
      } else {
        logger.severe('Failed to log in as $company : $username, credentials refused.');
      }
    } catch (error) {
      logger.severe('Generic error $error');
    }
  }

  // ==================================================
  // Manager Status
  // ==================================================

  static Future<void> addManagerToAvailableStaff(String uid) async {
    Logger logger = createLogger('AddManagerToAvailable');

    final response = await getEndpoint('setManagerStatus').call({
      'id': uid,
      'status': 'Online',
    });

    logger.fine('Set $uid to Online, result $response');
  }

  static Future<void> removeManagerFromAvailableStaff(String uid) async {
    Logger logger = createLogger('RemoveManagerFromAvailable');

    final response = await getEndpoint('setManagerStatus').call({
      'id': uid,
      'status': 'Offline',
    });

    logger.fine('Set $uid to Offline, result $response');
  }
}