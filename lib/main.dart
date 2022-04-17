import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pets/firebase_options.dart';
import 'package:pets/src/modules/auth/signup/controller/sign_up_controller.dart';
import 'package:pets/src/modules/home/home_page.dart';
import 'package:pets/src/modules/welcome/welcome_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignUpController()),
      ],
      child: MaterialApp(
        title: 'Pets App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: FirebaseAuth.instance.currentUser == null
            ? const WelcomePage()
            : const HomePage(),
      ),
    );
  }
}
