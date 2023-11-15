import 'package:flutter/material.dart';
import 'package:morethantwo/core/utils/extension/context_extension.dart';
import 'package:morethantwo/features/app/app.dart';

class LoadingOverlay extends StatefulWidget {
  const LoadingOverlay({Key? key}) : super(key: key);

  @override
  LoadingOverlayState createState() => LoadingOverlayState();
}

class LoadingOverlayState extends State<LoadingOverlay> {
  bool _isLoading = false;

  void show() {
    setState(() => _isLoading = true);
  }

  void hide() {
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLoading) {
      return const SizedBox.shrink(); // Return an empty widget if not loading
    }

    return Positioned.fill(
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: Center(
          child: Container(
            width: 52,
            height: 52,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: context.white8Color,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(color: context.whiteColor, strokeWidth: 3,),
            ),
          )
        ),
      ),
    );
  }
}

class LoadingOverlayService {
  static void show() {
    loadingOverlayKey.currentState?.show();
  }

  static void hide() {
    loadingOverlayKey.currentState?.hide();
  }
}

// class LoadingLayerProvider extends StatelessWidget {
//   final Widget child;
//   const LoadingLayerProvider({Key? key, required this.child}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         child,
//         LoadingOverlay(key: _loadingOverlayKey),
//       ],
//     );
//   }
// }

