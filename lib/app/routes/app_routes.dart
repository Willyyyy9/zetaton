// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const WALLPAPER_DETAILS = _Paths.WALLPAPER_DETAILS;
  static const FAVOURITE = _Paths.FAVOURITE;
  static const SEARCH = _Paths.SEARCH;
  static const SPLASH = _Paths.SPLASH;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const WALLPAPER_DETAILS = '/wallpaper-details';
  static const FAVOURITE = '/favourite';
  static const SEARCH = '/search';
  static const SPLASH = '/splash';
}
