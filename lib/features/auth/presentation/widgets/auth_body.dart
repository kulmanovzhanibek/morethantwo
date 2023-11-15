import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:morethantwo/core/const/assets_image.dart';
import 'package:morethantwo/core/routes/routes.dart';
import 'package:morethantwo/core/utils/extension/context_extension.dart';
import 'package:morethantwo/core/utils/validation/validation.dart';
import 'package:morethantwo/features/auth/presentation/viewModel/viewModel.dart';
import 'package:morethantwo/features/auth/presentation/widgets/auth_button.dart';
import 'package:morethantwo/widgets/buttons/custom_button.dart';
import 'package:morethantwo/widgets/custom_textfield/custom_textfield.dart';

class AuthBody extends StatefulWidget {
  const AuthBody({Key? key}) : super(key: key);

  @override
  State<AuthBody> createState() => _AuthBodyState();
}

class _AuthBodyState extends State<AuthBody> {

  @override
  Widget build(BuildContext context) {
    final readVm = context.read<AuthViewModel>();
    final watchVm = context.watch<AuthViewModel>();
    return Scaffold(
        backgroundColor: context.blackColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 108,),
              Center(child: Text('Log in or sign up', style: context.h1,)),
              SizedBox(height: readVm.textError != null ? 32 : 56,),
              if(readVm.textError != null)
                ...[
                  SizedBox(
                      height: 20,
                      child: Text(watchVm.textError!,
                        style: context.f14w500.copyWith(fontWeight: FontWeight.w400, color: context.redColor),)
                  ),
                  const SizedBox(height: 4,),
                ],
              CustomTextField(
                onChanged: (value) {
                  if(value.isEmpty) {
                    readVm.textError = null;
                  }
                },
                inputFormatters: readVm.inputFormatters,
                controller: readVm.loginEditingController,
                hintText: 'Phone number or email',
                type: readVm.typeTextField,
              ),
              const SizedBox(height: 12,),
              CustomButton(
                isLoading: false,
                titleColor: context.blackColor,
                borderRadius: 20,
                color: context.whiteColor,
                title: 'Continue',
                type: ButtonType.FILL,
                onTap: () {
                  if(readVm.textError == null && readVm.loginEditingController.text.isNotEmpty) {
                    context.pushNamed(AppRoutes.codeRoute, extra: {'vm': readVm});
                  }
                },
              ),
              const SizedBox(height: 16,),
              Center(
                  child: Text('or', style: context.f14w500.copyWith(fontWeight: FontWeight.w400, color: context.white40Color),)),
              const SizedBox(height: 16,),
              AuthButton(
                iconWidget: SvgPicture.asset(AssetsImage.iconGoogle),
                title: 'Continue with Google',
              ),
              const SizedBox(height: 12,),
              AuthButton(
                iconWidget: SvgPicture.asset(AssetsImage.iconApple),
                title: 'Continue with Apple',
              ),
              const Spacer(),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'By continuing, you agree to ',
                            style: context.f14w500.copyWith(fontWeight: FontWeight.w400, color: context.white64Color)
                        ),
                        TextSpan(
                            text: 'Terms of Condition, ',
                            style: context.f14w500.copyWith(fontWeight: FontWeight.w400, color: context.accentColor)
                        ),
                        TextSpan(
                            text: 'and',
                            style: context.f14w500.copyWith(fontWeight: FontWeight.w400, color: context.white64Color)
                        ),
                        TextSpan(
                            text: ' Privacy Policy.',
                            style: context.f14w500.copyWith(fontWeight: FontWeight.w400, color: context.accentColor)
                        )
                      ]
                  )
              ),
              const SizedBox(height: 60,)
            ],
          ),
        )
    );
  }
}
