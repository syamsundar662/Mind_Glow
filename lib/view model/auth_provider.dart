import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get user => _auth.currentUser;
  bool isLoading = false;
  Future<void> signUp(
      String name, String age, String email, String password) async {
    try {
      isLoading = true;
      notifyListeners();
      // ignore: unused_local_variable
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userAuthDataCollection(name, email, age);
      isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException: ${e.message}');
      throw _getAuthErrorMessage(e);
    } catch (e) {
      log('Error: $e');
      throw 'An unexpected error occurred. Please try again later.';
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      throw _getAuthErrorMessage(e);
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    notifyListeners();
  }

  String _getAuthErrorMessage(FirebaseAuthException e) {
    log(e.code);
    switch (e.code) {
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'user-disabled':
        return 'This user has been disabled.';
      case 'user-not-found':
        return 'No user found with this email.';
      case 'wrong-password':
        return 'Incorrect password.';
      case 'email-already-in-use':
        return 'This email is already in use.';
      case 'weak-password':
        return 'The password is too weak.';
      default:
        return 'An unexpected error occurred. Please try again later.';
    }
  }

  Future<void> userAuthDataCollection(
      String name, String email, String age) async {
    final CollectionReference users = _firestore.collection('UserCollection');

    if (user != null) {
      DocumentReference userDataDoc = users.doc(user!.uid);
      final Map<String, dynamic> userDatas = {
        'username': name,
        'email': email,
        'age': age,
        'userId': user!.uid,
      };

      try {
        await userDataDoc.set(userDatas);
        log('User data added successfully: $userDatas');
      } catch (e) {
        log('Error adding user data: $e');
        throw 'Failed to add user data.';
      }
    } else {
      log('User is not authenticated.');
      throw 'User is not authenticated.';
    }
  }

  Future<Map<String, dynamic>> fetchUserData() async {
    try {
      if (user != null) {
        DocumentSnapshot userDoc =
            await _firestore.collection('UserCollection').doc(user!.uid).get();

        if (userDoc.exists) {
          return userDoc.data() as Map<String, dynamic>;
        } else {
          throw 'User data not found';
        }
      } else {
        throw 'User is not authenticated';
      }
    } catch (e) {
      log('Error fetching user data: $e');
      throw 'Failed to fetch user data';
    }
  }
}
