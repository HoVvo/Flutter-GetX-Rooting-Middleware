import 'package:flutter_getx_rooting_middleware/app/bindings/auth_binding.dart';
import 'package:flutter_getx_rooting_middleware/app/bindings/root_binding.dart';
import 'package:flutter_getx_rooting_middleware/app/middleware/auth_middleware.dart';
import 'package:flutter_getx_rooting_middleware/pages/404.dart';
import 'package:flutter_getx_rooting_middleware/pages/auth.dart';
import 'package:flutter_getx_rooting_middleware/pages/main_page.dart';
import 'package:flutter_getx_rooting_middleware/pages/root_page.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();

  static const initialRoute = "/home";
  static const authRoute = "/auth";

  static final unknownRoute =
      GetPage(name: '/notfound', page: () => const UnknownRoutePage());

  static String LOGIN_THEN(String afterSuccessfulLogin) =>
      '$authRoute?then=${Uri.encodeQueryComponent(afterSuccessfulLogin)}';

  static final routes = [
    GetPage(
      name: '/',
      page: () => const RootPage(),
      binding: RootBinding(),
      participatesInRootNavigator: true,
      preventDuplicates: true,
      children: [
        GetPage(
          middlewares: [
            EnsureAuthMiddleware(),
          ],
          name: initialRoute,
          page: () => const MainPage(),
          title: 'My Chat',
          transition: Transition.native,
          //binding: AuthBinding(),
        ),
        GetPage(
          middlewares: [
            EnsureNotAuthedMiddleware(),
          ],
          name: authRoute,
          page: () => const AuthenticationPage(),
          title: 'Log In',
          transition: Transition.zoom,
          binding: AuthBinding(),
        ),
      ],
    ),
  ];
}
