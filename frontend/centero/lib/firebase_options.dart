import 'package:centero/secrets.dart';
import 'package:firebase_core/firebase_core.dart';

const firebaseOptionsWeb = FirebaseOptions(
  apiKey: centeroFirebaseApiKey,
  appId: '1:934086295160:web:28c5929414a3261752b78d',
  messagingSenderId: '934086295160',
  projectId: 'centerobackend-14820',
  authDomain: 'centerobackend-14820.firebaseapp.com',
  databaseURL: 'https://centerobackend-14820-default-rtdb.firebaseio.com',
  storageBucket: 'centerobackend-14820.appspot.com',
);
