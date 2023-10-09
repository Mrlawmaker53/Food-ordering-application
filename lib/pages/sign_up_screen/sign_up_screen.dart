import 'package:flutter/material.dart';
import 'package:quizz_assignment/services/authetication.dart';
import 'package:quizz_assignment/utlits/common_widgets/custom_main_button.dart';
import 'package:quizz_assignment/utlits/common_widgets/text_field_widget.dart';
import 'package:quizz_assignment/utlits/utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthenticationMethod authenticationMethod = AuthenticationMethod();

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();

    String amazonLogo =
        'https://niveussolutions.com/wp-content/uploads/2022/05/niveus-logo-dark.png';
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //.. height= 10%
                Image.network(
                  amazonLogo,
                  height: screenSize.height * 0.10,
                ),

                //.. height = 50%
                SizedBox(
                  height: screenSize.height * 0.7,
                  child: FittedBox(
                    child: Container(
                      height: screenSize.height * 0.85,
                      width: screenSize.width * 0.8,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                      ),
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextFieldWidget(
                            obscureText: false,
                            title: "Name",
                            controller: nameController,
                            hintText: 'Enter your name',
                          ),
                          TextFieldWidget(
                            obscureText: false,
                            title: "Address",
                            controller: addressController,
                            hintText: 'Enter your address',
                          ),
                          TextFieldWidget(
                            obscureText: false,
                            title: "Email",
                            controller: emailController,
                            hintText: 'Enter your email',
                          ),
                          TextFieldWidget(
                            obscureText: true,
                            title: "Password",
                            controller: passwordController,
                            hintText: 'Enter your password',
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: CustomMainButton(
                                color: Colors.orange,
                                isLoading: false,
                                onPressed: () async {
                                  authenticationMethod.signUpMethod(
                                    context: context,
                                    emailController: emailController.text,
                                    passwordController: passwordController.text,
                                    nameController: nameController.text,
                                    addressController: addressController.text,
                                  );
                                },
                                child: const Text(
                                  'Sign In',
                                  style: TextStyle(
                                      letterSpacing: 0.6, color: Colors.black),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                CustomMainButton(
                    color: Colors.grey[400]!,
                    isLoading: false,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Back',
                      style: TextStyle(letterSpacing: 0.6, color: Colors.black),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    addressController.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
