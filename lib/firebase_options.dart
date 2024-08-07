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
    apiKey: 'AIzaSyALlpJjHFAA3E7cyGprsq2bXOX-wkRD5Qo',
    appId: '1:860595738600:web:f3ccc12fe43d9aecf2765d',
    messagingSenderId: '860595738600',
    projectId: 'kmc-citizen-app',
    authDomain: 'kmc-citizen-app.firebaseapp.com',
    databaseURL: 'https://kmc-citizen-app-default-rtdb.firebaseio.com',
    storageBucket: 'kmc-citizen-app.appspot.com',
    measurementId: 'G-VHB2HTLESH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAIwjfIgN4GO24DG-m8krwLfgy-y22XCDg',
    appId: '1:860595738600:android:b388bf903f09e4e6f2765d',
    messagingSenderId: '860595738600',
    projectId: 'kmc-citizen-app',
    databaseURL: 'https://kmc-citizen-app-default-rtdb.firebaseio.com',
    storageBucket: 'kmc-citizen-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBzr2YiWfku_8KbK4kDx0Q_UYVyj_HyQ2Q',
    appId: '1:860595738600:ios:a0352fe7426a2c74f2765d',
    messagingSenderId: '860595738600',
    projectId: 'kmc-citizen-app',
    databaseURL: 'https://kmc-citizen-app-default-rtdb.firebaseio.com',
    storageBucket: 'kmc-citizen-app.appspot.com',
    androidClientId:
        '860595738600-lqhftnkrc2gouf73oak0m19lealau5ig.apps.googleusercontent.com',
    iosClientId:
        '860595738600-5078e2ba454uamj9fp2jucduh6uv2cam.apps.googleusercontent.com',
    iosBundleId: 'com.example.kmcapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBzr2YiWfku_8KbK4kDx0Q_UYVyj_HyQ2Q',
    appId: '1:860595738600:ios:3d077719cfb4e75bf2765d',
    messagingSenderId: '860595738600',
    projectId: 'kmc-citizen-app',
    databaseURL: 'https://kmc-citizen-app-default-rtdb.firebaseio.com',
    storageBucket: 'kmc-citizen-app.appspot.com',
    androidClientId:
        '860595738600-lqhftnkrc2gouf73oak0m19lealau5ig.apps.googleusercontent.com',
    iosClientId:
        '860595738600-rselknuluhgt6aqk605q7kne098m27tc.apps.googleusercontent.com',
    iosBundleId: 'com.example.kmcapp.RunnerTests',
  );
}
