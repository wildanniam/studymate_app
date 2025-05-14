part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const login = _Paths.login;
  static const register = _Paths.register;
  static const home = _Paths.home;
}

abstract class _Paths {
  _Paths._();
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';
}
