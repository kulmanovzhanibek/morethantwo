import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SpinKitRing(
      color: Colors.black,
      lineWidth: 2,
      size: 24.0,
    );
  }
}
