// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCWdz7jHa2V2T8UbVNozuho4jHapPsEJUg',
    appId: '1:229091336989:android:b2dcaad31100f0beb9b7f4',
    messagingSenderId: '229091336989',
    projectId: 'pets-d0aad',
    storageBucket: 'pets-d0aad.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBTCYLsgzva3aeOdoMzee69XASSw3gHB7c',
    appId: '1:229091336989:ios:bc8cafd61cba424fb9b7f4',
    messagingSenderId: '229091336989',
    projectId: 'pets-d0aad',
    storageBucket: 'pets-d0aad.appspot.com',
    iosClientId: '229091336989-gcj3neh9bdim2jusmgib4cpq4tob84kk.apps.googleusercontent.com',
    iosBundleId: 'com.example',
  );
}
