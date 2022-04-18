import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'modules/auth/login/controller/login_controller.dart';
import 'modules/auth/signup/controller/sign_up_controller.dart';
import 'modules/auth/welcome/welcome_page.dart';
import 'modules/home/home_page.dart';
import 'shared/services/auth/login_service.dart';
import 'shared/services/auth/sign_up_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => SignUpService()),
        ChangeNotifierProvider(
            create: (context) => SignUpController(context.read())),
        Provider(create: (_) => LoginService()),
        ChangeNotifierProvider(
            create: (context) => LoginController(context.read())),
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