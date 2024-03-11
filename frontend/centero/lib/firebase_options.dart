// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBZ5BiOQbVf7PHkhkejEEaOOmf8XNIUY7U',
    appId: '1:934086295160:web:28c5929414a3261752b78d',
    messagingSenderId: '934086295160',
    projectId: 'centerobackend-14820',
    authDomain: 'centerobackend-14820.firebaseapp.com',
    databaseURL: 'https://centerobackend-14820-default-rtdb.firebaseio.com',
    storageBucket: 'centerobackend-14820.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDBuYiYNbVmGB708G2GJYApVlgDIcZIX_I',
    appId: '1:934086295160:android:cd58f8a9a209680e52b78d',
    messagingSenderId: '934086295160',
    projectId: 'centerobackend-14820',
    databaseURL: 'https://centerobackend-14820-default-rtdb.firebaseio.com',
    storageBucket: 'centerobackend-14820.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCo0CUMUnNOF2Q6EkJhKeytg6pi2c5u0cc',
    appId: '1:934086295160:ios:ee9b51286d81178352b78d',
    messagingSenderId: '934086295160',
    projectId: 'centerobackend-14820',
    databaseURL: 'https://centerobackend-14820-default-rtdb.firebaseio.com',
    storageBucket: 'centerobackend-14820.appspot.com',
    iosBundleId: 'com.example.centero',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCo0CUMUnNOF2Q6EkJhKeytg6pi2c5u0cc',
    appId: '1:934086295160:ios:bb1499c3f52d153e52b78d',
    messagingSenderId: '934086295160',
    projectId: 'centerobackend-14820',
    databaseURL: 'https://centerobackend-14820-default-rtdb.firebaseio.com',
    storageBucket: 'centerobackend-14820.appspot.com',
    iosBundleId: 'com.example.centero.RunnerTests',
  );
}