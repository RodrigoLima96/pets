import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:pets/src/modules/add/pages/addPet/add_pet_page.dart';
import 'package:pets/src/modules/auth/pages/login/login_page.dart';
import 'package:pets/src/modules/auth/pages/signup/sign_up_page.dart';
import 'package:pets/src/modules/auth/pages/welcome/welcome_page.dart';
import 'package:pets/src/modules/home/pages/home/home_page.dart';
import 'package:pets/src/modules/profile/pages/settings/edit_pet/edit_pet_page.dart';
import 'package:pets/src/routes/router_utils.dart';

class AppRouter {
  GoRouter get router => _router;

  final _router = GoRouter(
    initialLocation: FirebaseAuth.instance.currentUser == null
        ? AppPage.welcome.toPath
        : AppPage.teste.toPath,
    routes: <GoRoute>[
      GoRoute(
        path: AppPage.home.toPath,
        name: AppPage.home.toName,
        builder: (context, state) => const HomePage(index: 1),
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
      GoRoute(
        path: AppPage.teste.toPath,
        name: AppPage.teste.toName,
        builder: (context, state) => const EditPetPage(),
      ),
    ],
  );
}
