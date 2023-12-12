import 'package:class_register/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: const FirebaseOptions(
      apiKey: "AIzaSyBOz0w6rBJZi5SJOOFYvlyCVOMPpu5C4wU",
  authDomain: "student-register-bd139.firebaseapp.com",
  projectId: "student-register-bd139",
  storageBucket: "student-register-bd139.appspot.com",
  messagingSenderId: "808803189047",
  appId: "1:808803189047:web:fbfa6276af342441781ab2",
  measurementId: "G-8906WXBGVK"
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