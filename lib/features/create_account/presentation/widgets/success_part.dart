import 'package:flutter/material.dart';
import 'package:morethantwo/core/utils/extension/context_extension.dart';
import 'package:morethantwo/features/create_account/presentation/viewModel/viewModel.dart';
import 'package:morethantwo/widgets/buttons/custom_button.dart';
import 'package:provider/provider.dart';

class SuccessPart extends StatelessWidget {
  const SuccessPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final readVm = context.read<CreateAccountViewModel>();
    final watchVm = context.watch<CreateAccountViewModel>();
    return Scaffold(
      backgroundColor: context.blackColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 24,),
            Center(
                child: Column(
                  children: [
                    Text('You’re almost done', style: context.h2,),
                    const SizedBox(height: 4,),
                    Text('Take a quick quiz to complete your profile.', style: context.f16w500.copyWith(fontWeight: FontWeight.w400),)
                  ],
                )
            ),
            const SizedBox(height: 48,),
            Center(
              child: CustomButton(
                onTap: () {
                },
                size: ButtonSize.M,
                type: ButtonType.FILL,
                color: context.whiteColor,
                titleColor: context.blackColor,
                title: 'Start'
              ),
            ),
            const SizedBox(height: 24,)
          ],
        ),
      ),
    );
  }
}
