
import 'package:morethantwo/widgets/loading/loading.dart';

import 'bootstrap.dart';
import 'core/const/flavor_config.dart';
import 'features/app/app.dart';

void main() {
  FlavorConfig(
    flavor: Flavor.development,
    values: FlavorValues(
      name: 'SME',
      baseUrl: 'https://sme-dev.p-s.kz',
    ),
  );

  bootstrap(() => const App());
}
