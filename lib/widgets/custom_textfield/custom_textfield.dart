import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:morethantwo/core/utils/extension/context_extension.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextFieldType? type;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  final bool? withOutBorder;
  final bool? isTextCenter;

  const CustomTextField({
    Key? key,
    this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onSubmitted, this.type, this.onChanged, this.inputFormatters, this.withOutBorder, this.isTextCenter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        inputFormatters: inputFormatters,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        onSubmitted: onSubmitted,
        cursorColor: context.whiteColor,
        onChanged: onChanged,
        textAlign: isTextCenter != true ? TextAlign.start : TextAlign.center,
        decoration: withOutBorder != true ? InputDecoration(
            hintText: hintText,
            contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 17.0),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: BorderSide(color: context.white16Color, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide(color: context.whiteColor,)
            ),
            hintStyle: context.f16w500.copyWith(fontWeight: FontWeight.w400, color: context.white40Color)
        ) : InputDecoration(
          hintText: hintText,
          hintStyle: context.f16w500.copyWith(fontWeight: FontWeight.w400, color: context.white40Color),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        style: context.f16w500.copyWith(fontWeight: FontWeight.w400)
    );
  }
}

enum TextFieldType {
  Email,
  Phone
}