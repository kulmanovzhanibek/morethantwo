import 'package:flutter/material.dart';
import 'package:morethantwo/core/utils/extension/context_extension.dart';
import 'package:morethantwo/features/create_account/presentation/viewModel/viewModel.dart';
import 'package:morethantwo/widgets/buttons/custom_back_button.dart';
import 'package:morethantwo/widgets/buttons/custom_button.dart';
import 'package:morethantwo/widgets/custom_textfield/custom_textfield.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class DatePart extends StatelessWidget {
  const DatePart({Key? key}) : super(key: key);

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
                  readVm.animateToPage(1);
                },
              ),
            ),
            const SizedBox(height: 24,),
            Center(
                child: Column(
                  children: [
                    Text('When is your birthday?', style: context.h1,),
                  ],
                )
            ),
            const SizedBox(height: 56,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Month', style: context.f14w500.copyWith(color: context.white64Color, fontWeight: FontWeight.w400),),
                    const SizedBox(height: 8,),
                    Center(
                      child: SizedBox(
                        width: 32,
                        child: PinCodeTextField(
                          keyboardType: TextInputType.number,
                          autoFocus: true,
                          controller: TextEditingController(),
                          textStyle: context.f16w500.copyWith(fontWeight: FontWeight.w400, fontSize: 20),
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.underline,
                            fieldHeight: 24,
                            fieldWidth: 12,
                            activeColor: context.whiteColor,
                            selectedColor: context.accentColor,
                            inactiveColor: context.white16Color,
                            disabledColor: context.white16Color,
                          ),
                          length: 2,
                          obscureText: false,
                          animationType: AnimationType.fade,
                          animationDuration: const Duration(milliseconds: 300),
                          onChanged: (value) {
                          },
                          appContext: context,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 24,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Day', style: context.f14w500.copyWith(color: context.white64Color, fontWeight: FontWeight.w400),),
                    const SizedBox(height: 8,),
                    Center(
                      child: SizedBox(
                        width: 32,
                        child: PinCodeTextField(
                          keyboardType: TextInputType.number,
                          autoFocus: true,
                          controller: TextEditingController(),
                          textStyle: context.f16w500.copyWith(fontWeight: FontWeight.w400, fontSize: 20),
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.underline,
                            fieldHeight: 24,
                            fieldWidth: 12,
                            activeColor: context.whiteColor,
                            selectedColor: context.accentColor,
                            inactiveColor: context.white16Color,
                            disabledColor: context.white16Color,
                          ),
                          length: 2,
                          obscureText: false,
                          animationType: AnimationType.fade,
                          animationDuration: const Duration(milliseconds: 300),
                          onChanged: (value) {
                          },
                          appContext: context,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 24,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Year', style: context.f14w500.copyWith(color: context.white64Color, fontWeight: FontWeight.w400),),
                    const SizedBox(height: 8,),
                    Center(
                      child: SizedBox(
                        width: 76,
                        child: PinCodeTextField(
                          keyboardType: TextInputType.number,
                          autoFocus: true,
                          controller: TextEditingController(),
                          textStyle: context.f16w500.copyWith(fontWeight: FontWeight.w400, fontSize: 20),
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.underline,
                            fieldHeight: 24,
                            fieldWidth: 12,
                            activeColor: context.whiteColor,
                            selectedColor: context.accentColor,
                            inactiveColor: context.white16Color,
                            disabledColor: context.white16Color,
                          ),
                          length: 4,
                          obscureText: false,
                          animationType: AnimationType.fade,
                          animationDuration: const Duration(milliseconds: 300),
                          onChanged: (value) {
                          },
                          appContext: context,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            Center(
              child: CustomButton(
                onTap: () {
                  readVm.animateToPage(3);
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
