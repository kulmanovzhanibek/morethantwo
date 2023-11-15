import 'package:flutter/material.dart';
import 'package:morethantwo/core/utils/extension/context_extension.dart';

class CustomBackButton extends StatelessWidget {
  final Function()? onTap;
  const CustomBackButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () { Navigator.pop(context); },
      child: Icon(
        Icons.chevron_left,
        color: context.whiteColor,
        size: 28,
      ),
    );
  }
}
