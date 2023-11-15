import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:morethantwo/core/injection_container.config.dart';

final sl = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => sl.init();