import 'package:rider/app/app.locator.dart';
import 'package:rider/models/auth_models/login_body.dart';
import 'package:rider/responses/profile_response.dart';
import 'package:rider/services/device_info_service.dart';
import 'package:rider/services/local_storage_service.dart';
import 'package:rider/services/notification_service.dart';
import 'package:stacked/stacked.dart';
import 'package:rider/app/app.logger.dart';
import 'package:rider/models/auth_models/signup_body.dart';
import 'package:rider/models/user_profile.dart';
import 'package:rider/responses/auth_response.dart';
import 'package:rider/services/database_service.dart';

class AuthService with ListenableServiceMixin {
  AuthService() {
    listenToReactiveValues([userProfile]);
  }

  String? fcmToken;
  late bool _isLogin;
  UserProfile? userProfile;
  static final log = getLogger('AuthService');
  final _dbService = locator<DatabaseService>();
  final _localStorageService = locator<LocalStorageService>();

  get getUserProfile => _getUserProfile();

  get isLogin => _localStorageService.accessToken != null;

  set login(val) => val;

  ///
  /// [doSetup] Function does the following things:
  ///   1) Checks if the user is logged then:
  ///       a) Get the user profile data
  ///       b) Updates the user FCM Token
  ///
  Future<void> doSetup() async {
    _isLogin = _localStorageService.accessToken != null;
    if (_isLogin) {
      log.d('User is already logged-in');
      await _getUserProfile();
      _updateFcmToken();
    } else {
      log.d('@doSetup: User is not logged-in');
    }
  }

  ///sign up (email and pass)
  Future<AuthResponse> signUpWithEmailAndPassword(SignUpBody body) async {
    AuthResponse response = await _dbService.createAccount(body);
    if (response.success) {
      _localStorageService.accessToken = response.accessToken;
      await _getUserProfile();
      await _updateFcmToken();
    }
    return response;
  }

  ///user profile
  Future<dynamic> _getUserProfile() async {
    ProfileResponse response = await _dbService.getUserProfile();
    // _localStorageService.accessToken =
    //     "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiYTAxZDE0YzFlNTNmMzkwOWYzZGU4OWRjODAxZjljYTNiOWEyMjQzYTlmN2U5NzU0NDZkNDU5NGUzZmU2MTQzNjBlMmNiOWI3MzRjZWNlODkiLCJpYXQiOjE3MDU3MDQ0NjEuNTYwMDQ4LCJuYmYiOjE3MDU3MDQ0NjEuNTYwMDUxLCJleHAiOjE3MzczMjY4NjEuNTU0OTI5LCJzdWIiOiIyNzAiLCJzY29wZXMiOltdfQ.J0TtEojB2XRUEcRVqSEa-iP1_Whz9udD8MW9sHS1z-ze8IXhZA6PeCTA4GN8kgxHCDRCuScCGNScC2saMRkK45f8Hf3FA0y7lKCzJYsJFJ_YNTQs7HKxVkw7prVcvPftI8T_I7dwGyg3VdzOxqRAZnwiGJvTp0za8F3QUr725mmDRokoMMgD1q71AzVTBe6HpLk6pCJgV9kUAv-ejD7rcbsODhLK0i93NDSvF8E_c9ro_5cm2HDU2JiZscx5hErbQgw8EfjBl-O1BOvb_UPhLvGhINxQWZeX1O5KR8BU7qZdPsA3fFRCj2XyblmI4gFlz251YMJ9yNoLB76elzrM8ytbARpEHFYMRZ05EfcOKHQZR2vZ6o_nw30M2O_k0ouus6wF1bz3fqfe2VFoup3f4Vp4JLV-8CuC_xyt6GISgv5r2b2sHmJybnbWcPJeCxDkPFDKvmP4YozYUMw1r5ZsLTdVRRHMeNoKS3lrejeSHR1hrugN2N5Zx6HgeioYAXiTBbgHyndstYrpFOKTkXdQJO1AfHzLbwRgrYRon1qX3HxLIeZXszQ7Kp2KjaqT7q8kT8SJBCJKhMHumi_8p47B6mdNf3CQsWBTvvlSQkIFSMF-pTv5gBWEr6LsgPhW29xTMWK215femDz0yDseirdEYjsuzTHG2Gl7oLw4pxLhbf4";
    if (response.success) {
      userProfile = response.body;
      log.wtf(userProfile?.id);
      log.d('Got User Data: ${userProfile?.toJson()}');
      return userProfile;
    } else {
      // logout();
      // _getUserProfile();
      return null;
    }
  }

  ///
  /// Updating FCM Token here...
  ///
  Future<dynamic> _updateFcmToken() async {
    final fcmToken = await locator<NotificationService>().getFcmToken();
    final deviceId = await DeviceInfoService().getDeviceId();
    if (deviceId != null) {
      final response = await _dbService.updateFcmToken(deviceId, fcmToken!);
      if (response.success) {
        // userProfile?.fcmToken = fcmToken;
      }
    }
  }

  ///login (email and pass)
  Future<AuthResponse> loginWithEmailAndPassword(LoginBody body) async {
    LoginBody loginBody = body;
    AuthResponse response =
    await _dbService.loginWithEmailAndPassword(loginBody);
    log.wtf(response.accessToken);
    if (response.success) {
      _localStorageService.accessToken = response.accessToken;
      await _getUserProfile();
      _updateFcmToken();
    }
    return response;
  }

// ///
  Future<dynamic> _clearFcm() async {
    final deviceId = await DeviceInfoService().getDeviceId();
    if (deviceId != null) {
      final response = await _dbService.clearFcmToken(deviceId);
      return response;
    }
  }

  Future<bool> logout() async {
    await _clearFcm();
    _isLogin = false;
    userProfile = null;
    _localStorageService.accessToken = null;
    return true;
  }

  Future<dynamic> deleteAccount() async {
    // final res = await _dbService.deleteAccount();
    logout();
    return true;
  }
}
