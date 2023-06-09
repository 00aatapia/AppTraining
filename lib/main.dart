import 'package:flutter/material.dart';
import 'controller/firestoreController.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
//flutter build web --web-renderer canvaskit

import 'pages/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyBObhk7p2R93Ggl_KZxrcQw4hIRVNEG2LY", // Your apiKey
        appId: "7ed4871fd5f30f020774b8", // Your appId
        messagingSenderId: "766994747817", // Your messagingSenderId
        projectId: "apptraining-26067", // Your projectId
      ),
    );
    Get.put(Peticiones2());
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'APPTraining',
      theme: ThemeData.light(),
      home: Login(),
    );
  }
}
