import 'package:flutter/cupertino.dart';

class OnBoardingViewModel extends ChangeNotifier {
  PageController pageController = PageController();
  int index = 1;

  void setIndex(int value) {
    index = value;
    notifyListeners();
  }

  List<Map<String, String>> onBoardingContent = [
    {
      "title": "Discover",
      "description": "Meet groups who share passions and interests of your group",
      "titleButton": "Continue"
    },
    {
      "title": "Create Invites",
      "description": "Can’t find something you like? Host your own event and invite others to join.",
      "titleButton": "Continue"
    },
    {
      "title": "Chat with groups",
      "description": "Join an invite and start a conversation with the group",
      "titleButton": "Get started"
    }
  ];

}