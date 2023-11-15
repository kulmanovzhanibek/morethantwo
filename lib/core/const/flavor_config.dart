import 'package:flutter/material.dart';

enum Flavor { production, development }

class FlavorValues {
  FlavorValues({
    required this.name,
    required this.baseUrl,
  });

  final String name;
  final String baseUrl;
}

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final FlavorValues values;
  static FlavorConfig? _instance;

  factory FlavorConfig({
    required Flavor flavor,
    Color color = Colors.blue,
    required FlavorValues values,
  }) {
    _instance ??= FlavorConfig._internal(
        flavor, FlavorConfig.flavorsToString(flavor), values);
    return _instance!;
  }

  FlavorConfig._internal(this.flavor, this.name, this.values);

  static FlavorConfig? get instance {
    return _instance;
  }

  static String flavorsToString(Flavor flavor) {
    switch (flavor) {
      case Flavor.production:
        return 'SME';
      case Flavor.development:
        return '[dev] SME';
    }
  }
}
