enum AppPage {
  welcome,
  login,
  singUp,
  home,
  addPet,
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
      default:
        return "home";
    }
  }
}
