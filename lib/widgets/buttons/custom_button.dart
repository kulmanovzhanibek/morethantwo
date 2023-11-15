import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:morethantwo/core/utils/extension/context_extension.dart';
import 'package:morethantwo/widgets/loading/loading_button.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final Function()? onTap;
  final ButtonSize? size;
  final Color? color;
  final ButtonType? type;
  final Color? borderColor;
  final Color? titleColor;
  final TextStyle? textStyle;
  final double? borderRadius;
  final bool? isLoading;
  const CustomButton({Key? key, this.title, this.onTap, this.size, this.color, this.type, this.borderColor, this.titleColor, this.textStyle, this.borderRadius, this.isLoading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: context.width - 32),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius ?? radius(size ?? ButtonSize.XS)),
              border: type == ButtonType.OUTLINE ? Border.all(
                color: borderColor ?? context.whiteColor,
                width: 2
              ) : null,
              color: color
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: paddingHorizontal(size ?? ButtonSize.XS,), vertical: size == null ? 13 : paddingVertical(size ?? ButtonSize.XS,)),
              child: isLoading == true ? const LoadingButton() : size == null ? Center(child: Text(title ?? '', style: textStyle ?? context.f18w500.copyWith(fontWeight: FontWeight.w600, color: titleColor),)) : Text(title ?? '', style: textStyle ?? context.f18w500.copyWith(fontWeight: FontWeight.w600, color: titleColor),),
            )
          ),
        )
    );
  }

  double paddingHorizontal(ButtonSize size) {
    return size == ButtonSize.XS ? 16 : size == ButtonSize.S ? 32 : size == ButtonSize.M ? 56 : 0;
  }

  double paddingVertical(ButtonSize size) {
    return size == ButtonSize.XS ? 6 : size == ButtonSize.S ? 10 : size == ButtonSize.M ? 13 : 0;
  }

  double radius(ButtonSize size) {
    return size == ButtonSize.XS ? 12 : size == ButtonSize.S ? 16 : size == ButtonSize.M ? 20 : 0;
  }
}

enum ButtonSize {
  XS,
  S,
  M
}


enum ButtonType {
  OUTLINE,
  FILL,
}
