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
    apiKey: 'AIzaSyBpNx_JV-_FtBQ4mRhnYC67_Kp_YBQR4rs',
    appId: '1:200240353129:web:3ff3f701acadbc9d1037f8',
    messagingSenderId: '200240353129',
    projectId: 'neura-chat-55d23',
    authDomain: 'neura-chat-55d23.firebaseapp.com',
    storageBucket: 'neura-chat-55d23.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAjZZzNNm1MWu0NKkTGXGI4Q6JJFAViP8I',
    appId: '1:200240353129:android:e89f5f5c2b05b44b1037f8',
    messagingSenderId: '200240353129',
    projectId: 'neura-chat-55d23',
    storageBucket: 'neura-chat-55d23.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCe2SOCbOEDxkSf4SLLB0dHJufGywcnUYs',
    appId: '1:200240353129:ios:68857f6e2cb6a1211037f8',
    messagingSenderId: '200240353129',
    projectId: 'neura-chat-55d23',
    storageBucket: 'neura-chat-55d23.firebasestorage.app',
    iosBundleId: 'com.example.neuraChat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCe2SOCbOEDxkSf4SLLB0dHJufGywcnUYs',
    appId: '1:200240353129:ios:68857f6e2cb6a1211037f8',
    messagingSenderId: '200240353129',
    projectId: 'neura-chat-55d23',
    storageBucket: 'neura-chat-55d23.firebasestorage.app',
    iosBundleId: 'com.example.neuraChat',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBpNx_JV-_FtBQ4mRhnYC67_Kp_YBQR4rs',
    appId: '1:200240353129:web:283dee4fc27df8e01037f8',
    messagingSenderId: '200240353129',
    projectId: 'neura-chat-55d23',
    authDomain: 'neura-chat-55d23.firebaseapp.com',
    storageBucket: 'neura-chat-55d23.firebasestorage.app',
  );

}