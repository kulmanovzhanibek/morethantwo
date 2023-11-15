import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morethantwo/features/create_account/presentation/viewModel/viewModel.dart';
import 'package:morethantwo/features/create_account/presentation/widgets/date_part.dart';
import 'package:morethantwo/features/create_account/presentation/widgets/gender_part.dart';
import 'package:morethantwo/features/create_account/presentation/widgets/name_part.dart';
import 'package:morethantwo/features/create_account/presentation/widgets/profile_part.dart';
import 'package:morethantwo/features/create_account/presentation/widgets/success_part.dart';

class CreateAccountBody extends StatelessWidget {
  const CreateAccountBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final readVm = context.read<CreateAccountViewModel>();
    final watchVm = context.watch<CreateAccountViewModel>();

    return Scaffold(
      body: PageView.builder(
          controller: readVm.pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: readVm.parts.length,
          onPageChanged: (index) {

          },
          itemBuilder: (context, index) {
            return readVm.parts[index];
          }
      ),
    );
  }
}
