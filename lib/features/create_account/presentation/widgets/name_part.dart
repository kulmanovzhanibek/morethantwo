import 'package:flutter/material.dart';
import 'package:morethantwo/core/utils/extension/context_extension.dart';
import 'package:morethantwo/features/create_account/presentation/viewModel/viewModel.dart';
import 'package:morethantwo/widgets/buttons/custom_button.dart';
import 'package:morethantwo/widgets/custom_textfield/custom_textfield.dart';
import 'package:provider/provider.dart';

class NamePart extends StatelessWidget {
  const NamePart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final readVm = context.read<CreateAccountViewModel>();
    final watchVm = context.watch<CreateAccountViewModel>();
    return Scaffold(
      backgroundColor: context.blackColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24,),
            Center(
                child: Column(
                  children: [
                    Text('Let’s start with your name', style: context.h1,),
                  ],
                )
            ),
            CustomTextField(
              controller: readVm.nameEditingController,
              hintText: 'Name',
              withOutBorder: true,
              isTextCenter: true,
            ),
            const Spacer(),
            Center(
              child: CustomButton(
                onTap: () {
                  readVm.animateToPage(1);
                },
                size: ButtonSize.M,
                type: ButtonType.FILL,
                color: context.whiteColor,
                titleColor: context.blackColor,
                title: 'Continue',
              ),
            ),
            const SizedBox(height: 24,)
          ],
        ),
      ),
    );
  }
}
