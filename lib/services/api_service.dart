import 'package:rider/app/app.dialogs.dart';
import 'package:rider/app/app.locator.dart';
import 'package:rider/app/app.logger.dart';
import 'package:rider/responses/base_responses/request_response.dart';
import 'package:rider/services/config_service.dart';
import 'package:rider/services/local_storage_service.dart';
import 'package:rider/services/token_interceptor_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:stacked_services/stacked_services.dart';

class ApiService {
  final log = getLogger('ApiService');
  final _config = locator<ConfigService>();
  final _dialogService = locator<DialogService>();

  Future<Dio> launchDio() async {
    await checkInternetConnection();
    // "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiYTAxZDE0YzFlNTNmMzkwOWYzZGU4OWRjODAxZjljYTNiOWEyMjQzYTlmN2U5NzU0NDZkNDU5NGUzZmU2MTQzNjBlMmNiOWI3MzRjZWNlODkiLCJpYXQiOjE3MDU3MDQ0NjEuNTYwMDQ4LCJuYmYiOjE3MDU3MDQ0NjEuNTYwMDUxLCJleHAiOjE3MzczMjY4NjEuNTU0OTI5LCJzdWIiOiIyNzAiLCJzY29wZXMiOltdfQ.J0TtEojB2XRUEcRVqSEa-iP1_Whz9udD8MW9sHS1z-ze8IXhZA6PeCTA4GN8kgxHCDRCuScCGNScC2saMRkK45f8Hf3FA0y7lKCzJYsJFJ_YNTQs7HKxVkw7prVcvPftI8T_I7dwGyg3VdzOxqRAZnwiGJvTp0za8F3QUr725mmDRokoMMgD1q71AzVTBe6HpLk6pCJgV9kUAv-ejD7rcbsODhLK0i93NDSvF8E_c9ro_5cm2HDU2JiZscx5hErbQgw8EfjBl-O1BOvb_UPhLvGhINxQWZeX1O5KR8BU7qZdPsA3fFRCj2XyblmI4gFlz251YMJ9yNoLB76elzrM8ytbARpEHFYMRZ05EfcOKHQZR2vZ6o_nw30M2O_k0ouus6wF1bz3fqfe2VFoup3f4Vp4JLV-8CuC_xyt6GISgv5r2b2sHmJybnbWcPJeCxDkPFDKvmP4YozYUMw1r5ZsLTdVRRHMeNoKS3lrejeSHR1hrugN2N5Zx6HgeioYAXiTBbgHyndstYrpFOKTkXdQJO1AfHzLbwRgrYRon1qX3HxLIeZXszQ7Kp2KjaqT7q8kT8SJBCJKhMHumi_8p47B6mdNf3CQsWBTvvlSQkIFSMF-pTv5gBWEr6LsgPhW29xTMWK215femDz0yDseirdEYjsuzTHG2Gl7oLw4pxLhbf4";
    String? accessToken = locator<LocalStorageService>().accessToken;
    print(accessToken);
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    dio.interceptors.add(TokenInterceptorService());
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["accept"] = 'application/json';
    dio.options.headers["Authorization"] = 'Bearer $accessToken';

    dio.options.followRedirects = false;
    // *STOP REQUESTING IN CASE OF TIMEOUT OR SLOW INTERNET CONNECTION
    // dio.options.connectTimeout = const Duration(seconds: 20);
    // dio.options.receiveTimeout = const Duration(seconds: 20);
    // dio.options.sendTimeout = const Duration(seconds: 20);

    dio.options.validateStatus = (s) {
      if (s != null) {
        return s < 500;
      } else {
        return false;
      }
    };
    return dio;
  }

  checkInternetConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      _showDialog();
      return;
    }
  }

  _showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'No Internet',
      description: "You have no internet connection! please connect to connect",
    );
  }

  get({required String endPoint, params}) async {
    String? errorMessage;
    try {
      Dio dio = await launchDio();
      final response = await dio.get('${_config.baseUrl}/$endPoint',
          queryParameters: params);

      // Dio full response error handling checks
      return getResponse(response);
    } catch (error) {
      log.e('@get error $error');
      log.e('@get error message: $errorMessage');
    }
    return RequestResponse.fromJson({'success': false, 'error': errorMessage});
  }

  post({required String endPoint, data, queryParameters}) async {
    final Response response;
    String? errorMessage;
    try {
      log.wtf('post base url:${_config.baseUrl}/$endPoint');
      Dio dio = await launchDio();
      response = await dio.post('${_config.baseUrl}/$endPoint',
          data: data, queryParameters: queryParameters);

      // Dio full response error handling checks
      // Dio full response error handling checks
      log.wtf('@get response $response');
      return getResponse(response);
    } catch (error) {
      log.e('@get error $error');
      log.e('@get error message: $errorMessage');
    }
    return RequestResponse.fromJson({'success': false, 'error': errorMessage});
  }

  put({required String endPoint, data}) async {
    String? errorMessage;
    try {
      Dio dio = await launchDio();
      final response =
          await dio.put('${_config.baseUrl}/$endPoint', data: data);
      // Dio full response error handling checks
      return getResponse(response);
    } catch (error) {
      log.e('@get error $error');
      log.e('@get error message: $errorMessage');
    }
    return RequestResponse.fromJson({'success': false, 'error': errorMessage});
  }

  delete({required String endPoint, params}) async {
    String? errorMessage;
    try {
      Dio dio = await launchDio();
      final response = await dio.delete('${_config.baseUrl}/$endPoint',
          queryParameters: params);
      // Dio full response error handling checks
      return getResponse(response);
    } catch (error) {
      log.e('@get error $error');
      log.e('@get error message: $errorMessage');
    }
    return RequestResponse.fromJson({'success': false, 'error': errorMessage});
  }

  getResponse(Response response) {
    if (response.statusCode.toString().contains("5")) {
      return RequestResponse(false,
          error: response.statusMessage ?? "server error");
    }
    if (response.statusCode.toString().contains("4")) {
      return RequestResponse(false,
          error: response.statusMessage ?? "unAuthenticated");
      // RequestErrorResponse.fromJson(response.data);
    } else {
      return RequestResponse.fromJson(response.data);
    }
  }
}
