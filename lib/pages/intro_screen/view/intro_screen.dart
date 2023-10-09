import 'package:flutter/material.dart';
import 'package:quizz_assignment/pages/sign_in_screen/sign_in_screen.dart';
import 'package:quizz_assignment/utlits/common_widgets/custom_main_button.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: Icon(
              Icons.flutter_dash,
              color: Colors.blueAccent,
              size: 200,
            ),
          ),
          const Text(
            'We deliver groceries at your doorstep',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          const Text('fresh item every day'),
          const Spacer(),
          CustomMainButton(
              color: Colors.grey[400]!,
              isLoading: false,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return const SignInScreen();
                    },
                  ),
                );
              },
              child: const Text(
                'Create an niveus Account',
                style: TextStyle(letterSpacing: 0.6, color: Colors.black),
              )),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
