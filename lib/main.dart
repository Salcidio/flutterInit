import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:init/view/login_screen.dart';
import './model/place_model.dart';
import './view/example.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: //LoginScreen(),
          ConfirmationScreen(),
    );
  }
}

// to upload the data in firebase
/*
class uploadDataInFirebase extends StatelessWidget {
  const uploadDataInFirebase({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: 
        ElevatedButton(
          onPressed: () {
            savePlacesToFirebase();
          },
          child: const Text("Upload data"),
        ),
      ),
    );
  }
}*/
