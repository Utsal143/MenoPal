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
    apiKey: 'AIzaSyBtZyuX9ORccx9IeLWu3ZmQe-3-XXyXcxY',
    appId: '1:488069798228:web:fca901f73705a95a79d0c1',
    messagingSenderId: '488069798228',
    projectId: 'meno-pal',
    authDomain: 'meno-pal.firebaseapp.com',
    storageBucket: 'meno-pal.appspot.com',
    measurementId: 'G-RG7CJ9EYCN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCiHsPzRHzX4_Q4dSRXKDCBuCx4qIIOuo8',
    appId: '1:488069798228:android:f0176163f4784f6679d0c1',
    messagingSenderId: '488069798228',
    projectId: 'meno-pal',
    storageBucket: 'meno-pal.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBQmD_qSYA_l8pGJNIOdr3MmvyEkewe65k',
    appId: '1:488069798228:ios:aac0ed079090007779d0c1',
    messagingSenderId: '488069798228',
    projectId: 'meno-pal',
    storageBucket: 'meno-pal.appspot.com',
    iosClientId: '488069798228-icio7u2k7ka04pgckdrl4uegsublird3.apps.googleusercontent.com',
    iosBundleId: 'com.example.menopal',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBQmD_qSYA_l8pGJNIOdr3MmvyEkewe65k',
    appId: '1:488069798228:ios:aac0ed079090007779d0c1',
    messagingSenderId: '488069798228',
    projectId: 'meno-pal',
    storageBucket: 'meno-pal.appspot.com',
    iosClientId: '488069798228-icio7u2k7ka04pgckdrl4uegsublird3.apps.googleusercontent.com',
    iosBundleId: 'com.example.menopal',
  );
}
