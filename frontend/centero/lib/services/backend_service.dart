import 'dart:convert';
import 'package:centero/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logging/logging.dart';

// ==================================================
// Exported Types
// ==================================================

class QueuedUserInfo {
  final String userid;
  QueuedUserInfo({
    required this.userid,
  });
}

class ResidentInfo {
  final String name;
  final String property;
  final String unitNumber;
  ResidentInfo({
    required this.name,
    required this.property,
    required this.unitNumber,
  });
}

class ManagerInfo {
  final String name;
  ManagerInfo({
    required this.name,
  });
}

// ==================================================
// Backend
// ==================================================

class BackendService {
  // ==================================================
  // Utilities
  // ==================================================

  FirebaseFirestore get _firestore {
    return FirebaseFirestore.instance;
  }

  Logger _createLogger(String name) {
    return Logger('Backend.$name');
  }

  HttpsCallable _getEndpoint(String name) {
    return FirebaseFunctions.instance.httpsCallable(name);
  }

  String hashPassword(String password) {
    final hasher = Hmac(sha256, Services.secrets.hmacKey);
    final digest = hasher.convert(utf8.encode(password));
    return digest.toString();
  }

  // ==================================================
  // Profile Fetch
  // ==================================================

  Future<ResidentInfo> getResidentProfile(String id) async {
    Logger logger = _createLogger('ResidentProfile');

    final doc = await _firestore.collection('ResidentProfiles').doc(id).get();
    logger.fine('Retrieved profile ${doc.id} ${doc.data()}');

    final data = doc.data();

    return ResidentInfo(
      name: data?['name'],
      property: data?['property'],
      unitNumber: data?['unitNumber'],
    );
  }

  Future<ManagerInfo> getManagerProfile(String id) async {
    Logger logger = _createLogger('ManagerProfile');

    final doc = await _firestore.collection('ManagerProfiles').doc(id).get();
    logger.fine('Retrieved profile ${doc.id} ${doc.data()}');

    return ManagerInfo(
      name: doc.data()?['name'],
    );
  }

  // ==================================================
  // Call Queue
  // ==================================================

  Future<List<QueuedUserInfo>?> getCallQueue({
    bool logInfo = true,
  }) async {
    final logger = _createLogger('CallQueue');

    final fullQueue = await _firestore.collection('CallQueue').get();
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

  Future<List<ManagerInfo>> getAvailableManagers() async {
    Logger logger = _createLogger('AvailableManagers');

    final activeCollection = await _firestore
        .collection('ActiveManagers')
        .where('status', isNotEqualTo: 'Offline')
        .get();
    final targets = activeCollection.docs.map((e) => e.id);

    logger.fine(
      'Found ${activeCollection.size} available: $targets',
    );

    final results = await _firestore
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

  Future<int> getAvailableManagersCount() async {
    Logger logger = _createLogger('AvailableManagersCount');

    final activeCollection = await _firestore
        .collection('ActiveManagers')
        .where('status', isNotEqualTo: 'Offline')
        .get();

    logger.fine('Retrieved collection $activeCollection');

    return activeCollection.size;
  }

  // ==================================================
  // Authentication
  // ==================================================

  Future<void> authenticateResidentManual({
    required String username,
    required String password,
  }) async {
    final logger = _createLogger('AuthResident.Manual');

    final passwordHash = hashPassword(password);
    logger.info('Logging in with `$username : $passwordHash`');

    try {
      final response = await _getEndpoint('authResidentManual').call(
        {
          'username': username,
          'passwordHash': passwordHash,
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

  Future<void> authenticateManager({
    required String company,
    required String username,
    required String password,
  }) async {
    final logger = _createLogger('AuthManager');

    final passwordHash = hashPassword(password);
    logger.info('Logging in with `$company : $username : $passwordHash`');

    try {
      final response = await _getEndpoint('authManager').call(
        {
          'company': company,
          'username': username,
          'passwordHash': passwordHash,
        },
      );

      bool success = response.data['success'];

      if (success) {
        String token = response.data['token'];
        final credential =
            await FirebaseAuth.instance.signInWithCustomToken(token);

        logger.info('Successful login. ${credential.user}');
      } else {
        logger.severe(
            'Failed to log in as $company : $username, credentials refused.');
      }
    } catch (error) {
      logger.severe('Generic error $error');
    }
  }

  // ==================================================
  // Face Scan
  // ==================================================

  Future<void> authenticateResidentFaceScan() async {
    final logger = _createLogger('AuthResidentFaceScan');

    try {
      final response = await _getEndpoint('authResidentFace').call();

      logger.info(response.data);
    } catch (error) {
      logger.severe('Generic error $error');
    }
  }


  // ==================================================
  // Manager Status
  // ==================================================

  Future<void> addManagerToAvailableStaff(String uid) async {
    Logger logger = _createLogger('AddManagerToAvailable');

    final response = await _getEndpoint('setManagerStatus').call({
      'id': uid,
      'status': 'Online',
    });

    logger.fine('Set $uid to Online, result $response');
  }

  Future<void> removeManagerFromAvailableStaff(String uid) async {
    Logger logger = _createLogger('RemoveManagerFromAvailable');

    final response = await _getEndpoint('setManagerStatus').call({
      'id': uid,
      'status': 'Offline',
    });

    logger.fine('Set $uid to Offline, result $response');
  }
}
