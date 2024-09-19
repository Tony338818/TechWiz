import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  User user = FirebaseAuth.instance.currentUser!;

  void createNewUser(String username ,String email,String password){
    auth.createUserWithEmailAndPassword(email: email, password: password);
  }
  void signIn(String email, String password) {
    auth.signInWithEmailAndPassword(email: email, password: password);
  }
}