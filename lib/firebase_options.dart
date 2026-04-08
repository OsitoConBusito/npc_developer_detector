import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions is not configured for ${defaultTargetPlatform.name}. '
          'Run FlutterFire CLI to add support.',
        );
      case TargetPlatform.fuchsia:
        throw UnsupportedError(
          'DefaultFirebaseOptions is not supported for fuchsia.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyApJ3-F2zuJBk5KQeYQLDaTwaRfLL266XM',
    appId: '1:190415037722:web:206532435d87f495b178a3',
    messagingSenderId: '190415037722',
    projectId: 'npc-developer-detector',
    authDomain: 'npc-developer-detector.firebaseapp.com',
    storageBucket: 'npc-developer-detector.firebasestorage.app',
  );
}
