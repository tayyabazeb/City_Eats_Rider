import 'package:rider/app/app.logger.dart';
import 'package:rider/models/user_models/auth_response_model.dart';
import 'package:rider/responses/base_responses/base_response.dart';

class AuthResponse extends BaseResponse {
  var log = getLogger("AuthResponse");
  String? accessToken;
  AuthResponseModel? authResponseModel;

  AuthResponse(success, {error}) : super(success, error: error);

  AuthResponse.fromJson(json) : super.fromJson(json) {
    log.wtf(json);
    if (json['body'] != null) {
      authResponseModel = AuthResponseModel.fromJson(json['body']);
    }
    accessToken = authResponseModel?.token;
  }
}
