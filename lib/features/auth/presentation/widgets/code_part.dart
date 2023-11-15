import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:morethantwo/core/routes/routes.dart';
import 'package:morethantwo/widgets/buttons/custom_button.dart';
import 'package:morethantwo/widgets/loading/loading.dart';
import 'package:provider/provider.dart';
import 'package:morethantwo/core/utils/extension/context_extension.dart';
import 'package:morethantwo/features/auth/presentation/viewModel/viewModel.dart';
import 'package:morethantwo/widgets/buttons/custom_back_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CodePart extends StatefulWidget {
  static const String path = 'code';

  const CodePart({Key? key}) : super(key: key);

  @override
  State<CodePart> createState() => _CodePartState();
}

class _CodePartState extends State<CodePart> {

  Timer? timer;
  int start = 60;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (start == 0) {
          timer.cancel();
        } else {
          setState(() {
            start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final readVm = context.read<AuthViewModel>();
    final watchVm = context.watch<AuthViewModel>();
    return Scaffold(
          backgroundColor: context.blackColor,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: CustomBackButton(),
                ),
                const SizedBox(height: 24,),
                Center(
                    child: Column(
                      children: [
                        Text('Enter code we sent to', style: context.h1,),
                        Text(readVm.loginEditingController.text, style: context.h3,),
                      ],
                    )
                ),
                const SizedBox(height: 48,),
                Center(
                  child: SizedBox(
                    width: 152,
                    child: PinCodeTextField(
                      keyboardType: TextInputType.number,
                      autoFocus: true,
                      controller: readVm.pinCodeEditingController,
                      textStyle: context.h1.copyWith(fontWeight: FontWeight.w400),
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.underline,
                        fieldHeight: 36,
                        fieldWidth: 32,
                        activeColor: context.whiteColor,
                        selectedColor: context.whiteColor,
                        inactiveColor: context.white16Color,
                        disabledColor: context.white16Color,
                      ),
                      length: 4,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      animationDuration: const Duration(milliseconds: 300),
                      onChanged: (value) {
                        if(value.length == 4) {
                          if (value == readVm.pinCode) {
                            LoadingOverlayService.show();
                            Future.delayed( const Duration(seconds: 1), () {
                              LoadingOverlayService.hide();
                              readVm.setIsErrorPinCode(false);
                              context.go(AppRoutes.createAccountRoute);
                            });
                          } else if (value != readVm.pinCode) {
                            LoadingOverlayService.show();
                            Future.delayed( const Duration(seconds: 1), () {
                              LoadingOverlayService.hide();
                              readVm.setIsErrorPinCode(true);
                            });
                          }
                        } else {
                          readVm.setIsErrorPinCode(false);
                        }
                      },
                      appContext: context,
                    ),
                  ),
                ),
                if(readVm.isErrorPinCode)
                  ...[
                    const SizedBox(height: 16,),
                    Center(child: Text('Enter correct code', style: context.f14w500.copyWith(fontWeight: FontWeight.w400, color: context.redColor),))
                  ],
                const Spacer(),
                if(start != 0) ...[
                  Center(child: Text('00:${start < 10 ? '0' : ''}$start', style: context.f16w500,)),
                ] else ...[
                  Center(
                    child: CustomButton(
                      isLoading: false,
                      titleColor: context.whiteColor,
                      borderRadius: 20,
                      color: context.white8Color,
                      title: 'Resend code',
                      size: ButtonSize.S,
                      type: ButtonType.FILL,
                      onTap: () {
                        setState(() {
                          start = 60;
                        });
                        startTimer();
                      },
                    ),
                  ),
                ],
                const SizedBox(height: 40,),
              ],
            ),
          ),
        );
  }
}
