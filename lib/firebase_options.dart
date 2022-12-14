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
    apiKey: 'AIzaSyDeBJ5-aFBIGz6oXNgw0UH4cWE0c38fmuM',
    appId: '1:1038251992980:web:edfb434c3fc433b7751181',
    messagingSenderId: '1038251992980',
    projectId: 'pixels-co',
    authDomain: 'pixels-co.firebaseapp.com',
    storageBucket: 'pixels-co.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBqwuOYQYOwGaLdETPKr_PBK5I4tBmmQQ0',
    appId: '1:1038251992980:android:bfc87fbf534899bd751181',
    messagingSenderId: '1038251992980',
    projectId: 'pixels-co',
    storageBucket: 'pixels-co.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBWDAwIH84mlilXsyh_BnAEccfZGUj4-JQ',
    appId: '1:1038251992980:ios:7375fb416ec56dd6751181',
    messagingSenderId: '1038251992980',
    projectId: 'pixels-co',
    storageBucket: 'pixels-co.appspot.com',
    iosClientId: '1038251992980-arhrm83bo3ka004lgc0nlfbivjsia8u0.apps.googleusercontent.com',
    iosBundleId: 'com.example.pixelsAdmin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBWDAwIH84mlilXsyh_BnAEccfZGUj4-JQ',
    appId: '1:1038251992980:ios:7375fb416ec56dd6751181',
    messagingSenderId: '1038251992980',
    projectId: 'pixels-co',
    storageBucket: 'pixels-co.appspot.com',
    iosClientId: '1038251992980-arhrm83bo3ka004lgc0nlfbivjsia8u0.apps.googleusercontent.com',
    iosBundleId: 'com.example.pixelsAdmin',
  );
}
