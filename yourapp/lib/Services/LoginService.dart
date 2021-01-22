import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:yourapp/Screens/Home.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginService {
  static void loginUsingFacebook(BuildContext context) async {
    final fb = FacebookLogin();
    final res = await fb.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);

    switch (res.status) {
      case FacebookLoginStatus.success:
        final profile = await fb.getUserProfile();
        final imageUrl = await fb.getProfileImageUrl(width: 100);
        final email = await fb.getUserEmail();

        Firebase.initializeApp().then((value) async {
          final auth = await FirebaseAuth.instance.signInWithCredential(
              FacebookAuthProvider.credential(res.accessToken.token));
          FirebaseFirestore.instance.collection('User').doc(auth.user.uid).set({
            'Username': profile.name,
            'Email': email,
            'image': imageUrl,
          }).then((_) => Navigator.popAndPushNamed(context, Home.id));
          // But user can decline permission
          if (email != null) print('And your email is $email');
        });
        break;
      case FacebookLoginStatus.cancel:
        // User cancel log in
        break;
      case FacebookLoginStatus.error:
        // Log in failed
        print('Error while log in: ${res.error}');
        break;
    }
  }

  static void loginUsingGoogle(BuildContext context) async {
    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    final account = await googleSignIn.signIn().catchError((e) => print(e));
    final GoogleSignInAuthentication googleSignInAuthentication =
        await account.authentication;
    Firebase.initializeApp().then((_) async {
      final auth = await FirebaseAuth.instance.signInWithCredential(
          GoogleAuthProvider.credential(
              accessToken: googleSignInAuthentication.accessToken,
              idToken: googleSignInAuthentication.idToken));
      FirebaseFirestore.instance.collection('User').doc(auth.user.uid).set({
        'Username': account.displayName,
        'Email': account.email,
        'image': account.photoUrl,
      }).then((_) => Navigator.popAndPushNamed(context, Home.id));
    });
  }
}
