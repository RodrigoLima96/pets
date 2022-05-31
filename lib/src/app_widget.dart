import 'package:flutter/material.dart';
import 'package:pets/src/modules/add/add/controllers/add_controller.dart';
import 'package:pets/src/modules/add/addPet/controllers/add_pet_controller.dart';
import 'package:pets/src/modules/add/addPet/controllers/add_pet_validator_controller.dart';
import 'package:pets/src/modules/add/addPost/controllers/add_post_controller.dart';
import 'package:pets/src/modules/add/addPost/controllers/add_post_validator_controller.dart';
import 'package:pets/src/modules/auth/login/controllers/login_validator_controller.dart';
import 'package:pets/src/modules/auth/signup/controllers/sign_up_validador_controller.dart';
import 'package:pets/src/modules/feed/controllers/feed_controller.dart';
import 'package:pets/src/modules/profile/profile/controllers/profile_controller.dart';
import 'package:pets/src/routes/app_router.dart';
import 'package:pets/src/services/add/add_pet_service.dart';
import 'package:pets/src/services/add/add_post_service.dart';
import 'package:pets/src/services/auth/login_service.dart';
import 'package:pets/src/services/auth/sign_up_service.dart';
import 'package:pets/src/services/getPets/get_pets_service.dart';
import 'package:provider/provider.dart';
import 'modules/auth/login/controllers/login_controller.dart';
import 'modules/auth/signup/controllers/sign_up_controller.dart';

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
        Provider(create: (_) => GetPetsService()),
        ChangeNotifierProvider(
            create: (context) => AddController(context.read())),
        ChangeNotifierProvider(create: (context) => FeedController()),
        Provider(create: (_) => AddPetService()),
        ChangeNotifierProvider(
            create: (context) =>
                AddPetController(context.read(), context.read())),
        Provider(create: (_) => AddPetValidatorController()),
        Provider(create: (_) => AddPostValidatorController()),
        Provider(create: (_) => AddPostService()),
        ChangeNotifierProvider(
            create: (context) => AddPostController(
                context.read(), context.read(), context.read())),
        ChangeNotifierProvider(
            create: (context) => ProfileController(context.read())),
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
