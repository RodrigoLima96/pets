import 'package:flutter/material.dart';
import 'package:pets/src/modules/add/controllers/add_controller.dart';
import 'package:pets/src/modules/add/controllers/add_pet_controller.dart';
import 'package:pets/src/modules/feed/controllers/post_controller.dart';
import 'package:pets/src/modules/profile/controllers/edit_pet_controller.dart';
import 'package:pets/src/modules/profile/controllers/edit_user_controller.dart';
import 'package:pets/src/modules/add/controllers/add_post_controller.dart';
import 'package:pets/src/modules/feed/controllers/feed_controller.dart';
import 'package:pets/src/modules/profile/controllers/profile_controller.dart';
import 'package:pets/src/routes/app_router.dart';
import 'package:pets/src/services/auth/auth_service.dart';
import 'package:pets/src/services/firestore/firestore_service.dart';
import 'package:pets/src/services/storage/storage_service.dart';
import 'package:pets/src/shared/utils/validator.dart';
import 'package:provider/provider.dart';
import 'modules/auth/controllers/login_controller.dart';
import 'modules/auth/controllers/sign_up_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppRouter _appRouter = AppRouter();
    return MultiProvider(
      providers: [
        Provider(create: (_) => AuthService()),
        Provider(create: (_) => FirestoreService()),
        Provider(create: (_) => Validator()),
        ChangeNotifierProvider(
            create: (context) => SignUpController(context.read())),
        ChangeNotifierProvider(
            create: (context) => LoginController(context.read())),
        ChangeNotifierProvider(
            create: (context) => AddController(context.read())),
        ChangeNotifierProvider(
            create: (context) => FeedController(context.read())),
        ChangeNotifierProvider(
            create: (context) => PostController(context.read())),
        Provider(create: (_) => StorageService()),
        ChangeNotifierProvider(
            create: (context) => AddPetController(
                context.read(), context.read(), context.read())),
        ChangeNotifierProvider(
            create: (context) => AddPostController(
                context.read(), context.read(), context.read())),
        ChangeNotifierProvider(
            create: (context) => ProfileController(context.read())),
        ChangeNotifierProvider(
            create: (context) => EditUserController(
                context.read(), context.read(), context.read())),
        ChangeNotifierProvider(
            create: (context) => EditPetController(
                context.read(), context.read(), context.read())),
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
