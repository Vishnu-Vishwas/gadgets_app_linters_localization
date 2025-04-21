import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gizmogrub_lints_localization/core/network/failure_constants.dart';
import 'package:gizmogrub_lints_localization/core/network/http_method.dart';
import 'package:gizmogrub_lints_localization/core/network/network_constants.dart';

class NetworkService {
  NetworkService() {
    final BaseOptions baseOptions = BaseOptions(
      baseUrl: NetworkConstants.baseUrl,
      connectTimeout: NetworkConstants.connectTimeout,
      receiveTimeout: NetworkConstants.receiveTimeout,
      headers: <String, String>{'Content-Type': NetworkConstants.contentType},
    );

    _dio = Dio(baseOptions);
    _dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true),
    );
  }
  late final Dio _dio;

  // get request
  Future<Either<Failure, dynamic>> get(
    String endpoint, {
    required HttpMethods method,
    Map<String, dynamic>? params,
  }) async {
    Response<dynamic> response;

    try {
      switch (method) {
        case HttpMethods.get:
          {
            response = await _dio.get(endpoint, queryParameters: params);
            break;
          }
        case HttpMethods.post:
          {
            response = await _dio.post(endpoint, data: params);
            break;
          }
        case HttpMethods.put:
          response = await _dio.put(endpoint, data: params);

        case HttpMethods.delete:
          response = await _dio.delete(endpoint);

        case HttpMethods.patch:
          response = await _dio.patch(endpoint, data: params);
      }

      if (response.statusCode != null) {
        if ((response.statusCode! >= 200) && (response.statusCode! <= 299)) {
          return Right<Failure, dynamic>(response);
        } else if ((response.statusCode! >= 400) &&
            (response.statusCode! <= 499)) {
          return Left<Failure, dynamic>(
            ClientFailure(
              errorCode: response.statusCode!,
              message: response.statusMessage!,
            ),
          );
        }
        if ((response.statusCode! >= 500) && (response.statusCode! <= 599)) {
          return Left<Failure, dynamic>(
            ServiceFailure(
              errorCode: response.statusCode!,
              message: response.statusMessage!,
            ),
          );
        }
        return const Left<Failure, dynamic>(UnexpectedFailure());
      } else {
        return const Left<Failure, dynamic>(UnexpectedFailure());
      }
    } on DioException catch (error) {
      return Left<Failure, dynamic>(Failure(-1, error.message!));
    } on Exception catch (error) {
      return Left<Failure, dynamic>(Failure(-1, error.toString()));
    }
  }
}
