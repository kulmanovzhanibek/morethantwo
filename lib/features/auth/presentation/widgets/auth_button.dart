import 'package:flutter/material.dart';
import 'package:morethantwo/core/utils/extension/context_extension.dart';

class AuthButton extends StatelessWidget {
  final Widget? iconWidget;
  final String? title;
  final Function()? onTap;
  const AuthButton({Key? key, this.iconWidget, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: context.white16Color),
          borderRadius: BorderRadius.circular(16)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(iconWidget != null) ...[
                iconWidget!,
                const SizedBox(width: 4,),
              ],
              Text(title ?? '', style: context.f16w500,)
            ],
          ),
        ),
      ),
    );
  }
}
