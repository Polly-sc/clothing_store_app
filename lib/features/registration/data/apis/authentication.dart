import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<Either<FirebaseAuthException, String?>> signIn(String email, String password);
  Future<Either<FirebaseAuthException, String?>> signUp(String email, String password);
  Future<String?> getCurrentUser();
  Future<void> signOut();
}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<String?> getCurrentUser() async {
    User? user = await _firebaseAuth.currentUser;
    return user?.uid;
  }

  @override
  Future<Either<FirebaseAuthException, String?>> signIn(String email, String password) async{
      try{
        UserCredential user = await _firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        return Right(user.user?.uid);
      } on FirebaseAuthException catch(e) {
        return Left(e);
      }
  }

  @override
  Future<void> signOut() async{
    return _firebaseAuth.signOut();
  }

  @override
  Future<Either<FirebaseAuthException, String?>> signUp(String email, String password) async{
    try{
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return Right(user.user?.uid);
    } on FirebaseAuthException catch(e) {
      return Left(e);
    }
  }
}