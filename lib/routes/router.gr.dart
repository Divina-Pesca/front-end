// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i6;

import '../screens/home/home.dart' as _i4;
import '../screens/inicio/inicio.dart' as _i5;
import '../screens/login/login.dart' as _i2;
import '../screens/register/register.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    LoginRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: const _i2.Login());
    },
    RegisterRoute.name: (entry) {
      var args = entry.routeData
          .argsAs<RegisterRouteArgs>(orElse: () => RegisterRouteArgs());
      return _i1.MaterialPageX(
          entry: entry, child: _i3.Register(key: args.key));
    },
    HomeRoute.name: (entry) {
      var args =
          entry.routeData.argsAs<HomeRouteArgs>(orElse: () => HomeRouteArgs());
      return _i1.MaterialPageX(entry: entry, child: _i4.Home(key: args.key));
    },
    InicioRoute.name: (entry) {
      var args = entry.routeData
          .argsAs<InicioRouteArgs>(orElse: () => InicioRouteArgs());
      return _i1.MaterialPageX(entry: entry, child: _i5.Inicio(key: args.key));
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(LoginRoute.name, path: '/'),
        _i1.RouteConfig(RegisterRoute.name, path: '/register'),
        _i1.RouteConfig(HomeRoute.name, path: '/home'),
        _i1.RouteConfig(InicioRoute.name, path: '/inicio')
      ];
}

class LoginRoute extends _i1.PageRouteInfo {
  const LoginRoute() : super(name, path: '/');

  static const String name = 'LoginRoute';
}

class RegisterRoute extends _i1.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({_i6.Key key})
      : super(name, path: '/register', args: RegisterRouteArgs(key: key));

  static const String name = 'RegisterRoute';
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key});

  final _i6.Key key;
}

class HomeRoute extends _i1.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i6.Key key})
      : super(name, path: '/home', args: HomeRouteArgs(key: key));

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i6.Key key;
}

class InicioRoute extends _i1.PageRouteInfo<InicioRouteArgs> {
  InicioRoute({_i6.Key key})
      : super(name, path: '/inicio', args: InicioRouteArgs(key: key));

  static const String name = 'InicioRoute';
}

class InicioRouteArgs {
  const InicioRouteArgs({this.key});

  final _i6.Key key;
}
