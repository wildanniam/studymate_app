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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyAOVQy4IN1BC2t02lT2msWqHNY6Y9y7JgM',
    appId: '1:54673825686:web:cd36e0aa2e2271bc6047b7',
    messagingSenderId: '54673825686',
    projectId: 'studymate-1140a',
    authDomain: 'studymate-1140a.firebaseapp.com',
    storageBucket: 'studymate-1140a.firebasestorage.app',
    measurementId: 'G-LYPRWRS160',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDNq2mkeOXHvYsDHsw3IWdo34a5eeIW7w4',
    appId: '1:54673825686:android:3264bf123c35e0af6047b7',
    messagingSenderId: '54673825686',
    projectId: 'studymate-1140a',
    storageBucket: 'studymate-1140a.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDNcEkrlQOEEB4jFwi21OWRf9gXx7uJgiM',
    appId: '1:54673825686:ios:ab7e3b4b6d8866b06047b7',
    messagingSenderId: '54673825686',
    projectId: 'studymate-1140a',
    storageBucket: 'studymate-1140a.firebasestorage.app',
    iosBundleId: 'com.example.studymateApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDNcEkrlQOEEB4jFwi21OWRf9gXx7uJgiM',
    appId: '1:54673825686:ios:ab7e3b4b6d8866b06047b7',
    messagingSenderId: '54673825686',
    projectId: 'studymate-1140a',
    storageBucket: 'studymate-1140a.firebasestorage.app',
    iosBundleId: 'com.example.studymateApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAOVQy4IN1BC2t02lT2msWqHNY6Y9y7JgM',
    appId: '1:54673825686:web:77b087fcc471e43e6047b7',
    messagingSenderId: '54673825686',
    projectId: 'studymate-1140a',
    authDomain: 'studymate-1140a.firebaseapp.com',
    storageBucket: 'studymate-1140a.firebasestorage.app',
    measurementId: 'G-M99LYB0WJM',
  );
}
