import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../data/local/dao/auth_dao.dart';
import '../../main.dart';
import '../../ui/presentation/pages/splash_page.dart';
import '../../util/error_handler.dart';

class BaseRemoteDataSource {
  final AuthDao _authDao;

  const BaseRemoteDataSource(this._authDao);

  Future<T> apiRequest<T>(
      {required apiCall, ErrorResolver? errorResolver}) async {
    try {
      return await apiCall;
    } catch (error) {
      try {
        if (error is DioError) {
          if (error.response?.statusCode != null &&
              error.response?.statusCode == 7) {
            await _authDao.insertJwtToken("");
            WidgetsBinding.instance.addPostFrameCallback((_) {
              navigator.currentState?.pushNamedAndRemoveUntil(
                  SplashPage.id, (Route<dynamic> route) => false);
            });
          } else {
            switch (error.type) {
              case DioErrorType.cancel:
                throw CancelError(error.message);
              case DioErrorType.connectTimeout:
                throw ConnectTimeoutError(error.message);
              case DioErrorType.sendTimeout:
                throw SendTimeoutError(error.message);
              case DioErrorType.receiveTimeout:
                throw ReceiveTimeoutError(error.message);
              case DioErrorType.other:
                throw Exception(error.message);
              case DioErrorType.response:
                throw ErrorHandler.resolveNetworkError(
                    response: error.response!,
                    customErrorResolver: errorResolver);
              default:
                throw Exception(error.message);
            }
          }
        }
      } catch (e) {
        rethrow;
      }
      throw Exception(error.toString());
    }
  }
}
