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
    apiKey: 'AIzaSyAUDdVjq-4UJKUiUqo3xOvJiqD2E0ywL-Q',
    appId: '1:723103004845:web:771b09a66a474e74d22e24',
    messagingSenderId: '723103004845',
    projectId: 'softareo-assignmnet-9b829',
    authDomain: 'softareo-assignmnet-9b829.firebaseapp.com',
    storageBucket: 'softareo-assignmnet-9b829.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD6BhkWrn7N3leIe4fet31B998WFq0lmu0',
    appId: '1:723103004845:android:c0914ce87ad55d8fd22e24',
    messagingSenderId: '723103004845',
    projectId: 'softareo-assignmnet-9b829',
    storageBucket: 'softareo-assignmnet-9b829.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAlBa8vFA1a2hDYM65LYT3J_MkSmjAfKoI',
    appId: '1:723103004845:ios:f705f1d131deda48d22e24',
    messagingSenderId: '723103004845',
    projectId: 'softareo-assignmnet-9b829',
    storageBucket: 'softareo-assignmnet-9b829.appspot.com',
    iosClientId: '723103004845-k6naoe3i9h3ss6d9807sj411h69bb2rp.apps.googleusercontent.com',
    iosBundleId: 'com.example.internAssign',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAlBa8vFA1a2hDYM65LYT3J_MkSmjAfKoI',
    appId: '1:723103004845:ios:f705f1d131deda48d22e24',
    messagingSenderId: '723103004845',
    projectId: 'softareo-assignmnet-9b829',
    storageBucket: 'softareo-assignmnet-9b829.appspot.com',
    iosClientId: '723103004845-k6naoe3i9h3ss6d9807sj411h69bb2rp.apps.googleusercontent.com',
    iosBundleId: 'com.example.internAssign',
  );
}