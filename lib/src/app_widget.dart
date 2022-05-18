import 'package:flutter/material.dart';
import 'package:pets/src/modules/add/addPet/controllers/add_pet_controller.dart';
import 'package:pets/src/modules/add/addPet/controllers/add_validator_controller.dart';
import 'package:pets/src/modules/auth/login/controllers/login_validator_controller.dart';
import 'package:pets/src/modules/auth/signup/controllers/sign_up_validador_controller.dart';
import 'package:pets/src/modules/feed/controllers/feed_controller.dart';
import 'package:pets/src/routes/app_router.dart';
import 'package:provider/provider.dart';
import 'modules/auth/login/controllers/login_controller.dart';
import 'modules/auth/signup/controllers/sign_up_controller.dart';
import 'shared/services/auth/login_service.dart';
import 'shared/services/auth/sign_up_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppRouter _appRouter = AppRouter();
    return MultiProvider(
      providers: [
        Provider(create: (_) => SignUpService()),
        ChangeNotifierProvider(
            create: (context) => SignUpController(context.read())),
        Provider(create: (_) => SignUpValidatorController()),
        Provider(create: (_) => LoginService()),
        ChangeNotifierProvider(
            create: (context) => LoginController(context.read())),
        Provider(create: (_) => LoginValidatorController()),
        ChangeNotifierProvider(create: (context) => FeedController()),
        ChangeNotifierProvider(create: (context) => AddController()),
        Provider(create: (_) => AddPetValidatorController()),
      ],
      child: MaterialApp.router(
        title: 'Pets App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        routeInformationParser: _appRouter.router.routeInformationParser,
        routerDelegate: _appRouter.router.routerDelegate,
      ),
    );
  }
}
