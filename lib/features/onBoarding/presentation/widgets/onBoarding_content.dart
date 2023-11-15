import 'package:flutter/material.dart';
import 'package:morethantwo/core/utils/extension/context_extension.dart';

import '../../../../widgets/buttons/custom_button.dart';

class OnBoardingContent extends StatelessWidget {
  final String title;
  final String description;
  final Function()? onTap;
  final String? titleButton;
  final int? index;

  const OnBoardingContent({Key? key, required this.title, required this.description, this.onTap, this.titleButton, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title, style: context.h1,),
          const SizedBox(height: 6,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(description, style: context.f16w500.copyWith(fontWeight: FontWeight.w400), textAlign: TextAlign.center,),
          ),
          const SizedBox(height: 39,),
          if(index == 2) ...[
            CustomButton(
              color: context.whiteColor,
                title: titleButton,
                size: ButtonSize.M,
                type: ButtonType.FILL,
                onTap: onTap,
                textStyle: context.f18w500.copyWith(fontWeight: FontWeight.w600, color: context.blackColor),
            ),
          ]
          else
            ...[
              CustomButton(
                  title: titleButton,
                  size: ButtonSize.M,
                  type: ButtonType.OUTLINE,
                  onTap: onTap
              ),
            ],
          const SizedBox(height: 127,)
        ],
      ),
    );
  }
}
