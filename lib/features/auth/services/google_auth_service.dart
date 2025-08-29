// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:zoom_flutter/features/auth/services/auth_service.dart';
//
// class GoogleAuthService implements AuthService {
//   final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   @override
//   Future<bool> signIn() async {
//     try {
//       final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();
//       final GoogleSignInAuthentication googleAuth = googleUser.authentication;
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.idToken,
//         idToken: googleAuth.idToken,
//       );
//
//       final UserCredential userCredential =
//           await _auth.signInWithCredential(credential);
//
//       if (userCredential.user != null) {
//         if (userCredential.additionalUserInfo!.isNewUser) {
//           _firestore.collection('users').doc(userCredential.user!.uid).set({
//             'id': userCredential.user!.uid,
//             'name': userCredential.user!.displayName,
//             'email': userCredential.user!.email,
//           });
//         }
//       }
//       return true;
//     } on FirebaseAuthException catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//       return false;
//     }
//   }
//
//   @override
//   Future<bool> signUp() async {
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<bool> signOut() async {
//     await _googleSignIn.signOut();
//     await _auth.signOut();
//     return true;
//   }
// }
