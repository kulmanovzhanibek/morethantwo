// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'services/dio/dio_interceptor.dart' as _i6;
import 'services/location/location.dart' as _i3;
import 'services/storage/security/security_storage.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.LocationService>(() => _i3.LocationService());
    gh.factory<_i4.SecurityStorage>(
        () => _i4.SecurityStorage(gh<_i5.FlutterSecureStorage>()));
    gh.factory<_i6.AuthInterceptor>(
        () => _i6.AuthInterceptor(gh<_i4.SecurityStorage>()));
    return this;
  }
}
