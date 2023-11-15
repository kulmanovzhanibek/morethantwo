import 'package:flutter/material.dart';
import 'package:morethantwo/core/utils/extension/context_extension.dart';

class OnBoardingImage extends StatelessWidget {
  final int index;
  const OnBoardingImage({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height * 0.7,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/img/onboarding_$index.png')
          )
      ),
      child: Container(
        width: context.width,
        height: context.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                context.blackColor.withOpacity(0.0),
                context.blackColor.withOpacity(0.94)
              ]
          ),
          color: context.blackColor,
        ),
      ),
    );
  }
}
