import 'package:flutter/material.dart';
import 'package:morethantwo/core/utils/extension/context_extension.dart';
import 'package:morethantwo/features/create_account/presentation/viewModel/viewModel.dart';
import 'package:morethantwo/widgets/buttons/custom_back_button.dart';
import 'package:morethantwo/widgets/buttons/custom_button.dart';
import 'package:morethantwo/widgets/custom_textfield/custom_textfield.dart';
import 'package:provider/provider.dart';

class GenderPart extends StatelessWidget {
  const GenderPart({Key? key}) : super(key: key);

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
                  readVm.animateToPage(2);
                },
              ),
            ),
            const SizedBox(height: 24,),
            Center(
                child: Column(
                  children: [
                    Text('Gender', style: context.h1,),
                    const SizedBox(height: 40,),
                    InkWell(
                      onTap: () {
                        readVm.setGenderType(GenderType.male);
                      },
                        child: Text('Male', style: context.f18w500.copyWith(fontSize: 20, color: GenderType.male == readVm.genderType ? context.whiteColor : context.white64Color),)
                    ),
                    const SizedBox(height: 26,),
                    InkWell(
                        onTap: () {
                          readVm.setGenderType(GenderType.female);
                        },
                        child: Text('Female', style: context.f18w500.copyWith(fontSize: 20, color: GenderType.female == readVm.genderType ? context.whiteColor : context.white64Color),)
                    ),
                    const SizedBox(height: 26,),
                    InkWell(
                        onTap: () {
                          readVm.setGenderType(GenderType.notSay);
                        },
                        child: Text('Prefer not to say', style: context.f18w500.copyWith(fontSize: 20, color: GenderType.notSay == readVm.genderType ? context.whiteColor : context.white64Color),)
                    ),
                  ],
                )
            ),
            const Spacer(),
            if(readVm.genderType != null)
            Center(
              child: CustomButton(
                onTap: () {
                  readVm.animateToPage(4);
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
