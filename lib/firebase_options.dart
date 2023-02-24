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
    apiKey: 'AIzaSyCCpHN-lej9ATuHKuOVbNQyww7Lze25PTY',
    appId: '1:216757909385:web:28bed5644e3246f19c9358',
    messagingSenderId: '216757909385',
    projectId: 'chat-sample-1b567',
    authDomain: 'chat-sample-1b567.firebaseapp.com',
    storageBucket: 'chat-sample-1b567.appspot.com',
    measurementId: 'G-2Z7RBMVXC6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCOaP1UiJbYgo_XZZKOc4z_1RjpZbyFH1Y',
    appId: '1:216757909385:android:072347c062e8ca519c9358',
    messagingSenderId: '216757909385',
    projectId: 'chat-sample-1b567',
    storageBucket: 'chat-sample-1b567.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBLSakLSOXsATTrlsEpiUbJd6QWy1Ya63Q',
    appId: '1:216757909385:ios:6b8438906521d8a29c9358',
    messagingSenderId: '216757909385',
    projectId: 'chat-sample-1b567',
    storageBucket: 'chat-sample-1b567.appspot.com',
    iosClientId: '216757909385-lmigqg7mj8e6822iilmokvan9sqiqqec.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterDemoFirebase',
  );
}