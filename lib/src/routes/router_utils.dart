enum AppPage {
  welcome,
  login,
  singUp,
  home,
  addPet,
  user,
  pet,
  addPost,
  editPost,
  post,
  settings,
  editProfile,
  editPetList,
  editPet,
}

extension AppPageExtension on AppPage {
  String get toPath {
    switch (this) {
      case AppPage.home:
        return "/";
      case AppPage.welcome:
        return "/welcome";
      case AppPage.login:
        return "/login";
      case AppPage.singUp:
        return "/singUp";
      case AppPage.addPet:
        return "/addPet";
      case AppPage.user:
        return "/user/:userId";
      case AppPage.pet:
        return "/pet";
      case AppPage.addPost:
        return "/addPost";
      case AppPage.editPost:
        return "/editPost";
      case AppPage.post:
        return "/post";
      case AppPage.settings:
        return "/settings";
      case AppPage.editProfile:
        return "/editProfile";
      case AppPage.editPetList:
        return "/editPetList";
      case AppPage.editPet:
        return "/editPet";
      default:
        return "/";
    }
  }

  String get toName {
    switch (this) {
      case AppPage.home:
        return "home";
      case AppPage.welcome:
        return "welcome";
      case AppPage.login:
        return "login";
      case AppPage.singUp:
        return "signUp";
      case AppPage.addPet:
        return "addPet";
      case AppPage.user:
        return "user";
      case AppPage.pet:
        return "pet";
      case AppPage.addPost:
        return "addPost";
      case AppPage.editPost:
        return "editPost";
      case AppPage.post:
        return "post";
      case AppPage.settings:
        return "settings";
      case AppPage.editProfile:
        return "editProfile";
      case AppPage.editPetList:
        return "editPetList";
      case AppPage.editPet:
        return "editPet";
      default:
        return "home";
    }
  }
}
