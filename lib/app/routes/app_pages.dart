import 'package:zetaton/app/modules/home/views/favourite/favourite_screen.dart';
import 'package:zetaton/app/modules/home/views/home/home_screen.dart';
import 'package:zetaton/app/modules/home/views/wallpaper-details/wallpaper_details_screen.dart';
import 'package:zetaton/app/modules/login/view/login_screen.dart';
import 'package:zetaton/app/modules/register/view/register_screen.dart';
import 'package:zetaton/app/modules/search/views/search_screen.dart';
import 'package:zetaton/app/modules/splash/views/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.SPLASH;

  static final routes = {
    Routes.LOGIN: (context) => const LoginScreen(),
    Routes.REGISTER: (context) => const RegisterScreen(),
    Routes.HOME: (context) => const HomeScreen(),
    Routes.WALLPAPER_DETAILS: (context) => const WallpaperDetailsScreen(),
    Routes.FAVOURITE: (context) => const FavouriteScreen(),
    Routes.SEARCH: (context) => const SearchScreen(),
    Routes.SPLASH: (context) => const SplashScreen(),
  };
}
