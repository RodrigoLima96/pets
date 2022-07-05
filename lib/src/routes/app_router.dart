import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:pets/src/models/pet.dart';
import 'package:pets/src/models/post.dart';
import 'package:pets/src/models/user.dart' as model;
import 'package:pets/src/modules/add/pages/addPet/add_pet_page.dart';
import 'package:pets/src/modules/add/pages/addPost/add_post_page.dart';
import 'package:pets/src/modules/auth/pages/login/login_page.dart';
import 'package:pets/src/modules/auth/pages/signup/sign_up_page.dart';
import 'package:pets/src/modules/auth/pages/welcome/welcome_page.dart';
import 'package:pets/src/modules/feed/pages/editPost/edit_post_page.dart';
import 'package:pets/src/modules/feed/pages/post/post_page.dart';
import 'package:pets/src/modules/home/pages/home/home_page.dart';
import 'package:pets/src/modules/profile/pages/pet/pet_page.dart';
import 'package:pets/src/modules/profile/pages/settings/edit_pet/edit_pet/edit_pet_page.dart';
import 'package:pets/src/modules/profile/pages/settings/edit_pet/petsList/edit_pets_list_page.dart';
import 'package:pets/src/modules/profile/pages/settings/edit_profile/edit_profile_page.dart';
import 'package:pets/src/modules/profile/pages/settings/settings/settings_page.dart';
import 'package:pets/src/routes/router_utils.dart';
import '../modules/profile/pages/profile/profile_page.dart';

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
        path: AppPage.user.toPath,
        name: AppPage.user.toName,
        builder: (context, state) => ProfilePage(uid: state.params['userId']!),
      ),
      GoRoute(
        path: AppPage.pet.toPath,
        name: AppPage.pet.toName,
        builder: (context, state) => PetPage(pet: state.extra! as Pet),
      ),
      GoRoute(
        path: AppPage.addPost.toPath,
        name: AppPage.addPost.toName,
        builder: (context, state) =>
            AddPostPage(pets: state.extra! as List<Pet>),
      ),
      GoRoute(
        path: AppPage.editPost.toPath,
        name: AppPage.editPost.toName,
        builder: (context, state) => EditPostPage(post: state.extra! as Post),
      ),
      GoRoute(
        path: AppPage.post.toPath,
        name: AppPage.post.toName,
        builder: (context, state) => PostPage(post: state.extra! as Post),
      ),
      GoRoute(
        path: AppPage.settings.toPath,
        name: AppPage.settings.toName,
        builder: (context, state) =>
            SettingsPage(userInfo: state.extra! as List<dynamic>),
      ),
      GoRoute(
        path: AppPage.editProfile.toPath,
        name: AppPage.editProfile.toName,
        builder: (context, state) =>
            EditProfilePage(user: state.extra! as model.User),
      ),
      GoRoute(
        path: AppPage.editPetList.toPath,
        name: AppPage.editPetList.toName,
        builder: (context, state) =>
            EditPetsListPage(pets: state.extra! as List<Pet>),
      ),
      GoRoute(
        path: AppPage.editPet.toPath,
        name: AppPage.editPet.toName,
        builder: (context, state) => EditPetPage(pet: state.extra! as Pet),
      ),
    ],
  );
}
