import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:yourapp/Screens/Login.dart';
import 'package:yourapp/Validation.dart';

class SignUpService {
  static void signUp(
    BuildContext context,
    String username,
    String email,
    String password,
    String confermPassword,
    bool checkedValue,
  ) {
    print('fdasssssssssss');
    final userValide = Validation.userValidation(username);
    final emailValide = Validation.emailValidation(email);
    final passwordValide = Validation.passwordValidation(password);
    final confermPasswordValide =
        Validation.confermPasswordValidation(confermPassword, password);

    if (!checkedValue) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('please agree the terms and privacy policy'),
        ),
      );
    } else if (!userValide &&
        !emailValide &&
        !passwordValide &&
        !confermPasswordValide) {
      print('fasdddddddddddddddd');
      Firebase.initializeApp().then((_) async {
        try {
          final auth = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password);
          FirebaseFirestore.instance.collection('User').doc(auth.user.uid).set({
            'Username': username,
            'Email': auth.user.email,
          }).then((_) => Navigator.popAndPushNamed(context, Login.id));
        } on FirebaseAuthException catch (e) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(e.message),
            ),
          );
        }
      });
    }
  }
}
