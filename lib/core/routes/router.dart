import 'package:aurastate/core/routes/app_routes.dart';
import 'package:aurastate/features/splash/presentation/screens/Splash_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final GoRouter approuter = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
    ],
  );
}
