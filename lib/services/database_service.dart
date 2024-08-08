import 'package:dio/dio.dart';
import 'package:rider/app/app.locator.dart';
import 'package:rider/app/app.logger.dart';
import 'package:rider/constants/end_points.dart';
import 'package:rider/models/address_body.dart';
import 'package:rider/models/auth_models/login_body.dart';
import 'package:rider/models/auth_models/signup_body.dart';
import 'package:rider/models/license_body.dart';
import 'package:rider/models/location_body.dart';
import 'package:rider/models/update_profile_body.dart';
import 'package:rider/responses/active_order_response.dart';
import 'package:rider/responses/address_response.dart';
import 'package:rider/responses/base_responses/base_response.dart';
import 'package:rider/responses/auth_response.dart';
import 'package:rider/responses/base_responses/request_response.dart';
import 'package:rider/responses/documents_response.dart';
import 'package:rider/responses/earnings_response.dart';
import 'package:rider/responses/order_response.dart';
import 'package:rider/responses/profile_response.dart';
import 'package:rider/responses/ratings_response.dart';
import 'package:rider/responses/specific_order_response.dart';
import 'package:rider/responses/vehicle_type.dart';
import 'package:rider/responses/vehicles_response.dart';
import 'package:rider/services/api_service.dart';
import 'package:rider/services/auth_service.dart';
import 'package:rider/services/update_profile_response.dart';
import '../models/vehicle_details_body.dart';

class DatabaseService {
  ///log
  var log = getLogger("DatabaseRepoService");

  ///services
  final ApiService _apiServices = locator<ApiService>();
  ApiService get apiServices => _apiServices;
  // ///profile
  // @override
  Future<ProfileResponse> getUserProfile() async {
    final RequestResponse response =
        await apiServices.get(endPoint: EndPoints.userProfile);
    return ProfileResponse.fromJson(response.data);
  }

  // ///token update
  // @override
  Future<BaseResponse> updateFcmToken(String deviceId, String token) async {
    final RequestResponse response = await apiServices.post(
      endPoint: EndPoints.fcmToken,
      data: {
        'device_id': deviceId,
        'fcm_token': token,
      },
    );
    return BaseResponse.fromJson(response.data);
  }

  // ///token clear
  // @override
  Future<BaseResponse> clearFcmToken(String deviceId) async {
    final RequestResponse response = await apiServices.post(
      endPoint: EndPoints.clearFcmToken,
      data: {'device_id': deviceId},
    );
    return BaseResponse.fromJson(response.data);
  }

  ///create account
  // @override
  Future<AuthResponse> createAccount(SignUpBody body) async {
    final RequestResponse response = await apiServices.post(
        endPoint: EndPoints.signUp, queryParameters: body.toJson());
    return AuthResponse.fromJson(response.data);
  }

  ///login (email,password)
  // @override
  Future<AuthResponse> loginWithEmailAndPassword(LoginBody body) async {
    final RequestResponse response =
        await apiServices.post(endPoint: EndPoints.login, data: body.toJson());
    return AuthResponse.fromJson(response.data);
  }

  ///login (email,password)
  // @override
  Future<RequestResponse> forgotPassword(String email) async {
    final RequestResponse response = await apiServices
        .post(endPoint: EndPoints.forgotPassword, data: {"email": email});
    return response;
  }

  ///reset password
  // @override
  Future<RequestResponse> resetPassword(
      String otp, String email, String newPass) async {
    final RequestResponse response = await apiServices.post(
        endPoint: EndPoints.resetPassword,
        data: {"email": email, "code": otp, "password": newPass});
    return response;
  }

  ///update location
  // @override
  Future<dynamic> updateLocation(LocationBody body) async {
    final RequestResponse response = await apiServices.post(
        endPoint:
            body.id != null ? EndPoints.updateLocation : EndPoints.location,
        data: body.toJson());
    return response.data;
  }

  ///verify otp
  // @override
  Future<AuthResponse> verifyOTP(String email, String otp) async {
    final RequestResponse response = await apiServices.post(
        endPoint: EndPoints.verifyOtp, data: {"email": email, "code": otp});
    return AuthResponse.fromJson(response.data);
  }

  ///sent otp
  // @override
  Future<dynamic> generateOTP(String email) async {
    final RequestResponse response = await apiServices
        .post(endPoint: EndPoints.generateOTP, data: {"email": email});
    return response.data;
  }

  ///
  //delete location
  Future<dynamic> deleteAccount() async {
    final RequestResponse response = await apiServices.get(
      endPoint: EndPoints.deleteAccount,
    );
    return response.data;
  }

  ///
  //add vehicle
  Future<dynamic> addVehicleDetails(VehicleDetails details) async {
    // 'make': make,
    //   'model': model,
    //   'year': year,
    //   'license_plate': licensePlate,
    //   'color': vehicleColor,
    //   'images': images.map((file) => file.path).toList(),
    //   'documents': documents?.path,
    final formData = FormData.fromMap({
      if (details.v5Image != null)
        'v5': await MultipartFile.fromFile(details.v5Image?.path ?? ""),
      if (details.motImage != null)
        'mot': await MultipartFile.fromFile(details.motImage?.path ?? ""),
      if (details.documents != null)
        'document': await MultipartFile.fromFile(details.documents?.path ?? ""),
      'license_plate': details.licensePlate,
      'make': details.make,
      'model': details.model,
      'year': details.year,
      'color': details.vehicleColor,
    });

    final RequestResponse response = await apiServices.post(
        endPoint: EndPoints.addVehicleDetails, data: formData);
    return response.data;
  }

  ///
  //add identity
  Future<dynamic> addIdentity(LicenseBody body) async {
    //
    final formData = FormData.fromMap({
      if (body.frontImage != null)
        'front_image': await MultipartFile.fromFile(body.frontImage!.path),
      if (body.backImage != null)
        'back_image': await MultipartFile.fromFile(body.backImage!.path),
      'issue_date': body.issueDate,
      'expiry_date': body.expiryDate,
      'issuing_state': body.issuingState,
    });
    final RequestResponse response =
        await apiServices.post(endPoint: EndPoints.addIdentity, data: formData);
    return response.data;
  }

  //get vehicle type
  Future<VehicleTypeResponse> getVehicleType() async {
    final RequestResponse response =
        await apiServices.get(endPoint: EndPoints.vehicleType);
    return VehicleTypeResponse.fromJson(response.data);
  }

  //add address
  Future<dynamic> addAddress(Address body) async {
    final RequestResponse response = await apiServices.post(
        endPoint: EndPoints.addAddress, data: body.toJson());
    return response.data;
  }

  //dispute
  Future<dynamic> dispute(String obj, String title, String desc) async {
    final RequestResponse response = await apiServices.post(
        endPoint: EndPoints.dispute,
        data: {
          "feedback_for": title,
          "feedback_title": title,
          "feedback_description": desc
        });
    return response.data;
  }

  ///
  //update profile
  Future<UpdateProfileResponse> updateProfile(UpdateProfileBody body) async {
    log.wtf(body.profileImage?.path);
    final formData = FormData.fromMap({
      if (body.profileImage?.path != null)
        'image': await MultipartFile.fromFile(body.profileImage?.path ?? ""),
      'name': body.name,
      'contact_number': body.phone,
    });
    final RequestResponse response = await apiServices.post(
        endPoint: EndPoints.updateProfile, data: formData);
    if (response.success) {
      await locator<AuthService>().getUserProfile;
    }

    return UpdateProfileResponse.fromJson(response.data);
  }

//change my password
  Future<dynamic> changeMyPassword(String oldPass, String newPass) async {
    final RequestResponse response = await apiServices.post(
        endPoint: EndPoints.changePassword,
        data: {"old_password": oldPass, "new_password": newPass});
    return response.data;
  }

  //fetch my orders
  Future<OrderResponse> fetchMyOrders() async {
    final RequestResponse response = await apiServices.get(
      endPoint: EndPoints.allOrder,
    );
    // return CartResponse.fromJson(response.data);
    return OrderResponse.fromJson(response.data);
  }

  //fetch order details
  Future<SpecificOrderResponse> fetchOrderDetails(int id) async {
    final RequestResponse response = await apiServices.get(
      endPoint: "${EndPoints.specificOrder}/$id",
    );
    // return CartResponse.fromJson(response.data);
    return SpecificOrderResponse.fromJson(response.data);
  }

  //fetch my documents
  Future<DocumentsResponse> fetchMyDocuments() async {
    final RequestResponse response = await apiServices.get(
      endPoint: EndPoints.getIdentity,
    );
    // return CartResponse.fromJson(response.data);
    return DocumentsResponse.fromJson(response.data);
  }

  ///
  //update identity
  Future<dynamic> updateIdentity(LicenseBody body) async {
    //
    final formData = FormData.fromMap({
      if (body.frontImage != null)
        'front_image': await MultipartFile.fromFile(body.frontImage!.path),
      if (body.backImage != null)
        'back_image': await MultipartFile.fromFile(body.backImage!.path),
      'issue_date': body.issueDate,
      'expiry_date': body.expiryDate,
      'issuing_state': body.issuingState,
    });
    final RequestResponse response = await apiServices.post(
        endPoint: EndPoints.updateIdentity, data: formData);
    return response.data;
  }

  //fetch my vehicle details
  Future<VehicleResponse> fetchMyVehicle() async {
    final RequestResponse response = await apiServices.get(
      endPoint: EndPoints.getVehicleDetails,
    );
    return VehicleResponse.fromJson(response.data);
  }

  ///
  //update vehicle
  Future<dynamic> updateVehicleDetails(VehicleDetails details) async {
    // 'make': make,
    //   'model': model,
    //   'year': year,
    //   'license_plate': licensePlate,
    //   'color': vehicleColor,
    //   'images': images.map((file) => file.path).toList(),
    //   'documents': documents?.path,
    final formData = FormData.fromMap({
      if (details.v5Image != null)
        'v5': await MultipartFile.fromFile(details.v5Image?.path ?? ""),
      if (details.motImage != null)
        'mot': await MultipartFile.fromFile(details.motImage?.path ?? ""),
      // if (details.leftSideImage != null)
      //   'left_side_image':
      //       await MultipartFile.fromFile(details.leftSideImage?.path ?? ""),
      // if (details.rightSideImage != null)
      //   'ride_side_image':
      //       await MultipartFile.fromFile(details.rightSideImage?.path ?? ""),
      if (details.documents != null)
        'document': await MultipartFile.fromFile(details.documents!.path),
      'license_plate': details.licensePlate,
      'make': details.make,
      'model': details.model,
      'year': details.year,
      'color': details.vehicleColor,
    });

    final RequestResponse response = await apiServices.post(
        endPoint: EndPoints.updateVehicleDetails, data: formData);
    return response.data;
  }

  //fetch my vehicle details
  Future<AddressResponse> fetchMyAddress() async {
    final RequestResponse response = await apiServices.get(
      endPoint: EndPoints.getAddress,
    );
    return AddressResponse.fromJson(response.data);
  }

  //update address
  Future<dynamic> updateAddress(Address body) async {
    final RequestResponse response = await apiServices.post(
        endPoint: EndPoints.updateAddress, data: body.toJson());
    return response.data;
  }

  //update address
  Future<dynamic> updateAddressFromHome(double lat, double lng) async {
    final RequestResponse response = await apiServices.post(
        endPoint: EndPoints.updateAddress, data: {"lat": lat, "lang": lng});
    return response.data;
  }

  //update address
  Future<dynamic> onlineOffline(int status) async {
    final RequestResponse response = await apiServices.get(
        endPoint: "${EndPoints.toggleOnlineOffline}/$status");
    return response.data;
  }

  //accept order
  Future<dynamic> acceptOrder(int id) async {
    final RequestResponse response =
        await apiServices.get(endPoint: "${EndPoints.acceptOrder}/$id");
    return response.data;
  }

  //current ride info
  Future<CurrentRideResponse> getCurrentRideInfo() async {
    final RequestResponse response =
        await apiServices.get(endPoint: EndPoints.currentRide);
    return CurrentRideResponse.fromJson(response.data);
  }

  //update ride status
  Future<OrderModel> updateRideStatus(int orderId, String status) async {
    final RequestResponse response = await apiServices.post(
        endPoint: EndPoints.updateRideStatus,
        data: {"order_id": orderId, "status": status});
    return OrderModel.fromJson(response.data['body']);
  }

  //get home data
  Future<RequestResponse> getHomeData() async {
    final RequestResponse response =
        await apiServices.get(endPoint: EndPoints.getHomeData);
    return response;
  }

  //get earnings
  Future<EarningsResponse> getEarnings() async {
    final RequestResponse response =
        await apiServices.get(endPoint: EndPoints.wallet);
    return EarningsResponse.fromJson(response.data);
  }

  //get ratings
  Future<RatingsResponse> getRatings() async {
    final RequestResponse response =
        await apiServices.get(endPoint: EndPoints.ratings);
    return RatingsResponse.fromJson(response.data);
  }

  //get Request Order
  Future<RatingsResponse> getRequestOrder() async {
    final RequestResponse response =
        await apiServices.get(endPoint: EndPoints.ratings);
    return RatingsResponse.fromJson(response.data);
  }
}
