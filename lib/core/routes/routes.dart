import 'package:morethantwo/features/auth/presentation/auth_screen.dart';
import 'package:morethantwo/features/auth/presentation/widgets/code_part.dart';
import 'package:morethantwo/features/create_account/presentation/create_account_screen.dart';
import 'package:morethantwo/features/home/presentation/home_screen.dart';


class AppRoutes {
  static const String onBoardingRoute = '/';


  static const String homeRoute = '/${HomeScreen.path}';

  //auth
  static const String authRoute = '/${AuthScreen.path}';
  static const String codeRoute = CodePart.path;
  static const String createAccountRoute = '/${CreateAccountScreen.path}';

}