import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizz_assignment/pages/home_screen/view/home_screen.dart';
import 'package:quizz_assignment/utlits/utils.dart';

class AuthenticationMethod {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<String> signUpUser(
      {required String name,
      required String address,
      required String email,
      required String password}) async {
    name.trim();
    address.trim();
    email.trim();
    password.trim();

    String output = "Something went wrong";
    if (name != "" && address != "" && email != "" && password != "") {
      output = "success";

      try {
        await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        output = "success";
      } catch (e) {
        output = e.toString();
      }
    } else {
      output = "Please fill up everything";
    }
    return output;
  }

  Future<String> signInUser(
      {required String email, required String password}) async {
    email.trim();
    password.trim();

    String output = "Something went wrong";
    if (email != "" && password != "") {
      output = "success";

      try {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        output = "success";
      } catch (e) {
        output = e.toString();
      }
    } else {
      output = "Please fill up everything";
    }
    return output;
  }

  signInMethod(
      {required BuildContext context,
      required String emailController,
      required String passwordController}) async {
    String output =
        await signInUser(email: emailController, password: passwordController);
    if (output == "success") {
      // ignore: use_build_context_synchronously
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return const HomeScreen();
      }));
    } else {
      // ignore: use_build_context_synchronously
      Utils().showSnackBar(context: context, content: output);
    }
  }

  signUpMethod(
      {required BuildContext context,
      required String emailController,
      required String passwordController,
      required String nameController,
      required String addressController}) async {
    String output = await signUpUser(
        name: nameController,
        address: addressController,
        email: emailController,
        password: passwordController);
    if (output == "success") {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) {
            return const HomeScreen();
          },
        ),
      );
    } else {
      // ignore: use_build_context_synchronously
      Utils().showSnackBar(context: context, content: output);
    }
  }
}
