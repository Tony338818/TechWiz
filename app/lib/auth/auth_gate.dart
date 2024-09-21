// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../pages/Home/home_screen.dart';
import 'login_or_register.dart';
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot){
            // user is logged in
            if (snapshot.hasData){
              return HomePage(navigateToGallery: () {  },);
            } else{
              return LoginOrRegister();
            }
          }
      ),
    );
  }
}
