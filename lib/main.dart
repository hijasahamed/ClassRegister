import 'package:class_register/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: const FirebaseOptions(
      apiKey: "AIzaSyAacfOKx5KfX0GAoYK1u_SkE98QVAgnTi0",
      appId: "1:808803189047:android:2d4326ae583e0691781ab2",
      messagingSenderId: "808803189047",
      projectId: "student-register-bd139",
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home:const Homescreen()
    );
  }
}