import 'package:flutter/material.dart';
import 'package:morethantwo/features/onBoarding/presentation/viewModel/viewModel.dart';
import 'package:morethantwo/features/onBoarding/presentation/widgets/onBoarding_body.dart';
import 'package:provider/provider.dart';


class OnBoardingScreen extends StatelessWidget {
  static const String path = 'onBoarding';
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnBoardingViewModel(),
      child: const OnBoardingBody()
    );
  }
}
