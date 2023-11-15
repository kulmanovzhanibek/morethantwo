import 'package:flutter/material.dart';
import 'package:morethantwo/core/utils/extension/context_extension.dart';
import 'package:morethantwo/features/onBoarding/presentation/widgets/onBoarding_image.dart';

class OnBoardingBackground extends StatelessWidget {
  final int index;
  const OnBoardingBackground({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if(index == 0)
          const OnBoardingImage(index: 1,),
        if(index == 1)
          const OnBoardingImage(index: 2,),
        if(index == 2)
          const OnBoardingImage(index: 3,),
        Container(
          width: context.width,
          height: context.height * 0.3,
          color: context.blackColor,
        )
      ],
    );
  }
}
