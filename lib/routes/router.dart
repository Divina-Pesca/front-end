import 'package:auto_route/auto_route.dart';
import 'package:divina_pesca/screens/home/home.dart';
import 'package:divina_pesca/screens/inicio/inicio.dart';
import 'package:divina_pesca/screens/login/login.dart';
import 'package:divina_pesca/screens/register/register.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: Login, path: "/", initial: true),
  MaterialRoute(page: Register, path: "/register"),
  MaterialRoute(page: Home, path: '/home'),
  MaterialRoute(page: Inicio, path: '/inicio')
])
class $AppRouter {}
