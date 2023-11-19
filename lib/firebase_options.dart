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
    apiKey: 'AIzaSyDT6RULLm7bSkkjInI2lvFBHIIgRRGjEYg',
    appId: '1:64577881746:web:fa445e4cab0030e3f8084b',
    messagingSenderId: '64577881746',
    projectId: 'gamepocketapp',
    authDomain: 'gamepocketapp.firebaseapp.com',
    storageBucket: 'gamepocketapp.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCXgXEjQYlzDG6Zj0BdRlnyKX6fFlt-0d0',
    appId: '1:64577881746:android:faae1b69c6eb5130f8084b',
    messagingSenderId: '64577881746',
    projectId: 'gamepocketapp',
    storageBucket: 'gamepocketapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBDzrDcZ9my-6gjBCor5ORxEmV6Eijnz8g',
    appId: '1:64577881746:ios:5d90ac22b3da2116f8084b',
    messagingSenderId: '64577881746',
    projectId: 'gamepocketapp',
    storageBucket: 'gamepocketapp.appspot.com',
    iosBundleId: 'com.game.pocket.gamepocket',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBDzrDcZ9my-6gjBCor5ORxEmV6Eijnz8g',
    appId: '1:64577881746:ios:4f9bb7537e597af0f8084b',
    messagingSenderId: '64577881746',
    projectId: 'gamepocketapp',
    storageBucket: 'gamepocketapp.appspot.com',
    iosBundleId: 'com.game.pocket.gamepocket.RunnerTests',
  );
}