import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:morethantwo/core/injection_container.dart';
import 'package:morethantwo/core/routes/routes.dart';
import 'package:morethantwo/core/services/location/location.dart';
import 'package:morethantwo/core/utils/extension/context_extension.dart';
import 'package:morethantwo/features/onBoarding/presentation/viewModel/viewModel.dart';
import 'package:morethantwo/features/onBoarding/presentation/widgets/onBoarding_background.dart';
import 'package:morethantwo/features/onBoarding/presentation/widgets/onBoarding_content.dart';


class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final readVm = context.read<OnBoardingViewModel>();
    final watchVm = context.watch<OnBoardingViewModel>();
    return Scaffold(
      body: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: readVm.pageController,
          itemCount: readVm.onBoardingContent.length,
          onPageChanged: (index) {
            readVm.setIndex(index + 1);
          },
          itemBuilder: (context, index) {
            return Stack(
              children: [
                OnBoardingBackground(index: index,),
                if(index != 2)
                  Positioned(
                      top: 60,
                      right: 24,
                      child: GestureDetector(
                        onTap: () {
                          readVm.setIndex(2);
                          readVm.pageController.jumpToPage(readVm.index);
                        },
                        child: Text('Skip', style: context.f18w500,),
                      )
                  ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    child: OnBoardingContent(
                      title: readVm.onBoardingContent[index]['title']!,
                      description: readVm.onBoardingContent[index]['description']!,
                      index: index,
                      onTap: () {
                        if (index != 2) {
                          readVm.setIndex(index + 1);
                          readVm.pageController.animateToPage(
                              readVm.index, duration: const Duration(milliseconds: 700), curve: Curves.ease);
                        } else {
                          final LocationService locationService = sl();
                          locationService.requestPermission();
                          context.go(AppRoutes.authRoute);
                        }
                      },
                      titleButton: readVm.onBoardingContent[index]['titleButton']!,
                    )
                )
              ],
            );
          }
      ),
    );
  }
}