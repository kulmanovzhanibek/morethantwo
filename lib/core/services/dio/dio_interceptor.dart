import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:morethantwo/core/services/storage/security/security_storage.dart';

import '../../const/endpoints.dart';
import '../../const/flavor_config.dart';

const _name = 'AuthInterceptor';

@injectable
class AuthInterceptor extends QueuedInterceptorsWrapper {
  final Dio tokenDio = Dio();
  final SecurityStorage _localStore;

  AuthInterceptor(this._localStore);

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String? locale;
    try {
      // locale = _localStore.getLocale();
      final token = null;

      if (token.access != null && token.refresh != null) {
        options.headers = {
          'Authorization': 'Bearer ${token.access}',
        };
      }
    } catch (e) {
      log('Token pair is absent');
    }
    if (locale != null) {
      options.headers.addAll({'lang': locale});
    }
    return super.onRequest(options, handler);
  }

  // @override
  // void onError(DioError err, ErrorInterceptorHandler handler) async {
  //   if (err.response?.statusCode == 401) {
  //     if (err.requestOptions.path.contains(Endpoints.api)) {
  //       handler.next(err);
  //       return;
  //     }
  //     try {
  //       final token = null;
  //       late TokenRemoteModel newToken;
  //       if (token.access != null && token.refresh != null) {
  //         newToken = await _refreshToken(token);
  //       }
  //       await _saveToken(newToken);
  //     } catch (e) {
  //       _handleExpiredRefresh(e, handler, err);
  //     }
  //   }
  //   handler.next(err);
  // }
  //
  // Future<TokenRemoteModel> _refreshToken(TokenLocalModel token) async {
  //   return await ApiService(tokenDio,
  //           baseUrl: FlavorConfig.instance?.values.baseUrl ?? '')
  //       .refreshToken(
  //     TokenRemoteModel(
  //       accessToken: token.access!,
  //       refreshToken: token.refresh!,
  //     ),
  //   );
  // }
  //
  // Future<void> _saveToken(TokenRemoteModel token) async {
  //   final newTokenModel = TokenLocalModel()
  //     ..access = token.accessToken
  //     ..refresh = token.refreshToken;
  //   _localStore.saveToken(newTokenModel);
  // }
  //
  // void _handleExpiredRefresh(
  //     Object e, ErrorInterceptorHandler handler, DioError err) {
  //   if (e is DioError) {
  //     if (e.response?.statusCode == 500) {
  //       log('Refresh token is expired', name: _name);
  //       handler.next(err);
  //     }
  //   }
  // }
}
