import 'package:cloud_functions/cloud_functions.dart';
import 'package:logging/logging.dart';

class QueuedUserInfo {
  final String userid;

  QueuedUserInfo({required this.userid});
}

Future<List<QueuedUserInfo>?> getCallQueue() async {
  final logger = Logger('Service.CallQueue');

  try {
    HttpsCallable func = FirebaseFunctions.instance.httpsCallable('getQueue');
    final response = await func.call();
    final docs = response.data['docs'];
    logger.info('Fetched call queue ${docs.toString()}');

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
