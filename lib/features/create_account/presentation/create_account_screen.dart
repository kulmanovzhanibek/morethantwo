import 'package:flutter/material.dart';
import 'package:morethantwo/features/create_account/presentation/viewModel/viewModel.dart';
import 'package:morethantwo/features/create_account/presentation/widgets/create_account_body.dart';
import 'package:morethantwo/widgets/loading/loading.dart';
import 'package:provider/provider.dart';

class CreateAccountScreen extends StatelessWidget {
  static const String path = 'createAccount';
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
            create: (context) => CreateAccountViewModel(),
            child: const CreateAccountBody()
        );
  }
}
