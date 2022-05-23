import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:pets/src/modules/add/addPet/add_pet_page.dart';
import 'package:pets/src/modules/auth/login/login_page.dart';
import 'package:pets/src/modules/auth/signup/sign_up_page.dart';
import 'package:pets/src/modules/auth/welcome/welcome_page.dart';
import 'package:pets/src/modules/home/home_page.dart';
import 'package:pets/src/routes/router_utils.dart';

class AppRouter {
  GoRouter get router => _router;

  final _router = GoRouter(
    initialLocation: FirebaseAuth.instance.currentUser == null
        ? AppPage.welcome.toPath
        : AppPage.home.toPath,
    routes: <GoRoute>[
      GoRoute(
        path: AppPage.home.toPath,
        name: AppPage.home.toName,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: AppPage.welcome.toPath,
        name: AppPage.welcome.toName,
        builder: (context, state) => const WelcomePage(),
      ),
      GoRoute(
        path: AppPage.login.toPath,
        name: AppPage.login.toName,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppPage.singUp.toPath,
        name: AppPage.singUp.toName,
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        path: AppPage.addPet.toPath,
        name: AppPage.addPet.toName,
        builder: (context, state) => const AddPetPage(),
      ),
    ],
  );
}
