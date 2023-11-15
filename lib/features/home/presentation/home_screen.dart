import 'package:flutter/material.dart';
import 'package:morethantwo/core/utils/extension/context_extension.dart';

class HomeScreen extends StatelessWidget {
  static const String path = 'home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.accentColor,
    );
  }
}
