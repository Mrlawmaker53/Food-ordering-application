import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_assignment/firebase_options.dart';
import 'package:quizz_assignment/pages/home_screen/controller/card_controller.dart';
import 'package:quizz_assignment/pages/intro_screen/view/intro_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
if(kIsWeb){
   {

    await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyC1vxUuyLwZNvSl74UGncCEIGpVM9aWFjU",
  authDomain: "food-ordering-app-niveus-solu.firebaseapp.com",
  projectId: "food-ordering-app-niveus-solu",
  storageBucket: "food-ordering-app-niveus-solu.appspot.com",
  messagingSenderId: "526661486260",
  appId: "1:526661486260:web:b5e6b9dc7bc2747ae8f9e1",
  measurementId: "G-F33V4L4HWJ"
));
}
}else{
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

}

  runApp(const MyApp());


}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=>CartController(),
      child: MaterialApp(
        title: 'food App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const IntroScreen(),
      ),
    );
  }
}

