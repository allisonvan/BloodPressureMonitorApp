import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class User{
  String firstName = 'null';
  String lastName = 'null';
  String email = 'null';
  String phone = 'null';
  String password = 'null';
  //contructor
  User(String firstName, String lastName, String email, String phone, String password){
    this.firstName = firstName;
    this.lastName = lastName;
    this.email = email;
    this.phone = phone;
    this.password = password;
  }
}

class AuthService{
  Future<void> signup({
    required String email,
    required String password
  }) async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, 
        password: password
        );
    } on FirebaseAuthException catch(e){
      String message = '';
      if(e.code == 'weak-password'){

      }else if (e.code == 'email-already-in-use'){
        message = 'An account already exists with that email.';
      }
    
    }
    catch(e){
      print('An unexpercted error occured: $e');
    }
  }
}
