import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:morethantwo/core/routes/route.dart';
import 'package:morethantwo/widgets/loading/loading.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

final GlobalKey<LoadingOverlayState> loadingOverlayKey = GlobalKey();

class _AppState extends State<App> {

  @override
  void initState() {
    EasyLoading.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      builder: (context, child) {
      return Builder(
        builder: (BuildContext context) {
          return Stack(
            children: [
              child!,
              LoadingOverlay(key: loadingOverlayKey),
            ],
          );
        },
      );
    },
    );
  }
}
