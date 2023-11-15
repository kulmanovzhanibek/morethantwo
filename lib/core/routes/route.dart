import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:morethantwo/core/routes/routes.dart';
import 'package:morethantwo/features/auth/presentation/auth_screen.dart';
import 'package:morethantwo/features/auth/presentation/viewModel/viewModel.dart';
import 'package:morethantwo/features/auth/presentation/widgets/code_part.dart';
import 'package:morethantwo/features/create_account/presentation/create_account_screen.dart';
import 'package:morethantwo/features/home/presentation/home_screen.dart';
import 'package:morethantwo/features/onBoarding/presentation/onBoarding_screen.dart';
import 'package:provider/provider.dart';


final GoRouter goRouter = GoRouter(
  routes: <RouteBase>[

    GoRoute(
      name: 'onBoarding',
      path: AppRoutes.onBoardingRoute,
      builder: (BuildContext context, GoRouterState state) {
        return const OnBoardingScreen();
      },
    ),

    GoRoute(
      name: 'home',
      path: AppRoutes.homeRoute,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),

    GoRoute(
        name: 'auth',
        path: AppRoutes.authRoute,
        builder: (BuildContext context, GoRouterState state) {
          return const AuthScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            name: 'code',
            path: AppRoutes.codeRoute,
            builder: (BuildContext context, GoRouterState state) {
              final vm = (state.extra as Map)['vm'] as AuthViewModel;
              return MultiProvider(
                providers: [
                  ChangeNotifierProvider.value(value: vm),
                ],
                child: const CodePart(),
              );
            },
          ),
        ]
    ),

    GoRoute(
      name: 'createAccount',
      path: AppRoutes.createAccountRoute,
      builder: (BuildContext context, GoRouterState state) {
        return const CreateAccountScreen();
      },
    ),


  ],
);