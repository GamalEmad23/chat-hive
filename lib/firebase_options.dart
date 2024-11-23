// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCfZDjbIE36xIwyACorMTF49ZT7Vx9dTJ0',
    appId: '1:1045096010571:web:32795cd9e5c9b380bdcece',
    messagingSenderId: '1045096010571',
    projectId: 'chathive-707fa',
    authDomain: 'chathive-707fa.firebaseapp.com',
    storageBucket: 'chathive-707fa.firebasestorage.app',
    measurementId: 'G-7LQY3EVDQX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCtTy7Rr46B8Zw4a68bFt7uHaz90fEBpLE',
    appId: '1:1045096010571:android:1e51b9e1c5ec1b58bdcece',
    messagingSenderId: '1045096010571',
    projectId: 'chathive-707fa',
    storageBucket: 'chathive-707fa.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB9vHCQnObxAail7p3zg3wCDlEw80Z_Gf0',
    appId: '1:1045096010571:ios:d31b994eadb1da72bdcece',
    messagingSenderId: '1045096010571',
    projectId: 'chathive-707fa',
    storageBucket: 'chathive-707fa.firebasestorage.app',
    iosBundleId: 'com.example.chatHive',
  );
}
