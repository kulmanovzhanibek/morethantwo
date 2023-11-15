import 'package:flutter/material.dart';
import 'package:morethantwo/features/create_account/presentation/widgets/date_part.dart';
import 'package:morethantwo/features/create_account/presentation/widgets/gender_part.dart';
import 'package:morethantwo/features/create_account/presentation/widgets/name_part.dart';
import 'package:morethantwo/features/create_account/presentation/widgets/profile_part.dart';
import 'package:morethantwo/features/create_account/presentation/widgets/success_part.dart';

class CreateAccountViewModel extends ChangeNotifier {

  List<Widget> parts = [
    const NamePart(),
    const ProfilePart(),
    const DatePart(),
    const GenderPart(),
    const SuccessPart()
  ];

  TextEditingController nameEditingController = TextEditingController();
  PageController pageController = PageController();
  GenderType? genderType;
  int index = 0;

  animateToPage(int index) {
    pageController.animateToPage(index, duration: const Duration(milliseconds: 700), curve: Curves.ease);
  }

  void setIndex(int value) {
    index = value;
    notifyListeners();
  }

  void setGenderType(GenderType value) {
    genderType = value;
    notifyListeners();
  }


  CreateAccountPart part = CreateAccountPart.name;

  setPart(CreateAccountPart value) {
    part = value;
    notifyListeners();
  }

  @override
  void dispose() {
    nameEditingController.dispose();
    super.dispose();
  }

}

enum CreateAccountPart {
  name,
  date,
  gender,
  profile,
  success
}

enum GenderType {
  male,
  female,
  notSay,
}