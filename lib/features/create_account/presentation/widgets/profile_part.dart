import 'package:flutter/material.dart';
import 'package:morethantwo/core/utils/extension/context_extension.dart';
import 'package:morethantwo/features/create_account/presentation/viewModel/viewModel.dart';
import 'package:morethantwo/widgets/buttons/custom_back_button.dart';
import 'package:morethantwo/widgets/buttons/custom_button.dart';
import 'package:morethantwo/widgets/custom_textfield/custom_textfield.dart';
import 'package:provider/provider.dart';


class ProfilePart extends StatelessWidget {
  const ProfilePart({Key? key}) : super(key: key);

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
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: CustomBackButton(
                onTap: () {
                  readVm.animateToPage(0);
                  },
              ),
            ),
            const SizedBox(height: 24,),
            Center(
                child: Column(
                  children: [
                    Text('Add your profile pic', style: context.h1,),
                    const SizedBox(height: 4,),
                    Text('Add your profile pic', style: context.f16w500.copyWith(color: context.white64Color, fontWeight: FontWeight.w400),),
                  ],
                )
            ),
            const Spacer(),
            Center(
              child: CustomButton(
                onTap: () {
                  readVm.animateToPage(2);
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
