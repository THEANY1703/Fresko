import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDn37TdgApKHEKxL8EOct1yqs-xS2TSq_Q",
            authDomain: "fresko-1e75d.firebaseapp.com",
            projectId: "fresko-1e75d",
            storageBucket: "fresko-1e75d.appspot.com",
            messagingSenderId: "739191332468",
            appId: "1:739191332468:web:8cddebbec21a8bd815bb21",
            measurementId: "G-BY38LF8QRM"));
  } else {
    await Firebase.initializeApp();
  }
}
