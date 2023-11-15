import 'package:flutter/material.dart';
import 'package:morethantwo/widgets/loading/loading.dart';
import 'package:provider/provider.dart';
import 'package:morethantwo/features/auth/presentation/viewModel/viewModel.dart';
import 'package:morethantwo/features/auth/presentation/widgets/auth_body.dart';


class AuthScreen extends StatelessWidget {
  static const String path = 'auth';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
          create: (context) => AuthViewModel(),
          child: const AuthBody()
      );
  }
}
