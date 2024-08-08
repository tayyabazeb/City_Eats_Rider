// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i34;
import 'package:flutter/material.dart';
import 'package:rider/responses/documents_response.dart' as _i35;
import 'package:rider/responses/order_response.dart' as _i37;
import 'package:rider/responses/vehicles_response.dart' as _i36;
import 'package:rider/ui/views/account/account_view.dart' as _i17;
import 'package:rider/ui/views/address/address_view.dart' as _i9;
import 'package:rider/ui/views/approval/approval_view.dart' as _i10;
import 'package:rider/ui/views/authentication/authentication_view.dart' as _i4;
import 'package:rider/ui/views/change_password/change_password_view.dart'
    as _i18;
import 'package:rider/ui/views/earning/earning_view.dart' as _i32;
import 'package:rider/ui/views/edit_address/edit_address_view.dart' as _i25;
import 'package:rider/ui/views/edit_vehicle_view/edit_vehicle_view_view.dart'
    as _i24;
import 'package:rider/ui/views/email_verification/email_verification_view.dart'
    as _i12;
import 'package:rider/ui/views/forgot_password/forgot_password_view.dart'
    as _i14;
import 'package:rider/ui/views/home/home_view.dart' as _i2;
import 'package:rider/ui/views/identity_verification/identity_verification_view.dart'
    as _i8;
import 'package:rider/ui/views/job_accept/job_accept_view.dart' as _i26;
import 'package:rider/ui/views/job_completed/job_completed_view.dart' as _i28;
import 'package:rider/ui/views/login/login_view.dart' as _i5;
import 'package:rider/ui/views/map/map_view.dart' as _i11;
import 'package:rider/ui/views/my_documents/my_documents_view.dart' as _i22;
import 'package:rider/ui/views/my_orders/my_orders_view.dart' as _i20;
import 'package:rider/ui/views/my_vehicles/my_vehicles_view.dart' as _i23;
import 'package:rider/ui/views/new_password/new_password_view.dart' as _i15;
import 'package:rider/ui/views/no_internet/no_internet_view.dart' as _i13;
import 'package:rider/ui/views/on_way/on_way_view.dart' as _i30;
import 'package:rider/ui/views/order_detail/order_detail_view.dart' as _i29;
import 'package:rider/ui/views/profile/profile_view.dart' as _i16;
import 'package:rider/ui/views/profile_settings/profile_settings_view.dart'
    as _i21;
import 'package:rider/ui/views/ratings/ratings_view.dart' as _i33;
import 'package:rider/ui/views/ride/ride_view.dart' as _i27;
import 'package:rider/ui/views/signup/signup_view.dart' as _i6;
import 'package:rider/ui/views/specific_order/specific_order_view.dart' as _i31;
import 'package:rider/ui/views/startup/startup_view.dart' as _i3;
import 'package:rider/ui/views/support_help/support_help_view.dart' as _i19;
import 'package:rider/ui/views/upload_vehicle_details/upload_vehicle_details_view.dart'
    as _i7;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i38;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const authenticationView = '/authentication-view';

  static const loginView = '/login-view';

  static const signupView = '/signup-view';

  static const uploadVehicleDetailsView = '/upload-vehicle-details-view';

  static const identityVerificationView = '/identity-verification-view';

  static const addressView = '/address-view';

  static const approvalView = '/approval-view';

  static const mapView = '/map-view';

  static const emailVerificationView = '/email-verification-view';

  static const noInternetView = '/no-internet-view';

  static const forgotPasswordView = '/forgot-password-view';

  static const newPasswordView = '/new-password-view';

  static const profileView = '/profile-view';

  static const accountView = '/account-view';

  static const changePasswordView = '/change-password-view';

  static const supportHelpView = '/support-help-view';

  static const myOrdersView = '/my-orders-view';

  static const profileSettingsView = '/profile-settings-view';

  static const myDocumentsView = '/my-documents-view';

  static const myVehiclesView = '/my-vehicles-view';

  static const editVehicleViewView = '/edit-vehicle-view-view';

  static const editAddressView = '/edit-address-view';

  static const jobAcceptView = '/job-accept-view';

  static const rideView = '/ride-view';

  static const jobCompletedView = '/job-completed-view';

  static const orderDetailView = '/order-detail-view';

  static const onWayView = '/on-way-view';

  static const specificOrderView = '/specific-order-view';

  static const earningView = '/earning-view';

  static const ratingsView = '/ratings-view';

  static const all = <String>{
    homeView,
    startupView,
    authenticationView,
    loginView,
    signupView,
    uploadVehicleDetailsView,
    identityVerificationView,
    addressView,
    approvalView,
    mapView,
    emailVerificationView,
    noInternetView,
    forgotPasswordView,
    newPasswordView,
    profileView,
    accountView,
    changePasswordView,
    supportHelpView,
    myOrdersView,
    profileSettingsView,
    myDocumentsView,
    myVehiclesView,
    editVehicleViewView,
    editAddressView,
    jobAcceptView,
    rideView,
    jobCompletedView,
    orderDetailView,
    onWayView,
    specificOrderView,
    earningView,
    ratingsView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.authenticationView,
      page: _i4.AuthenticationView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i5.LoginView,
    ),
    _i1.RouteDef(
      Routes.signupView,
      page: _i6.SignupView,
    ),
    _i1.RouteDef(
      Routes.uploadVehicleDetailsView,
      page: _i7.UploadVehicleDetailsView,
    ),
    _i1.RouteDef(
      Routes.identityVerificationView,
      page: _i8.IdentityVerificationView,
    ),
    _i1.RouteDef(
      Routes.addressView,
      page: _i9.AddressView,
    ),
    _i1.RouteDef(
      Routes.approvalView,
      page: _i10.ApprovalView,
    ),
    _i1.RouteDef(
      Routes.mapView,
      page: _i11.MapView,
    ),
    _i1.RouteDef(
      Routes.emailVerificationView,
      page: _i12.EmailVerificationView,
    ),
    _i1.RouteDef(
      Routes.noInternetView,
      page: _i13.NoInternetView,
    ),
    _i1.RouteDef(
      Routes.forgotPasswordView,
      page: _i14.ForgotPasswordView,
    ),
    _i1.RouteDef(
      Routes.newPasswordView,
      page: _i15.NewPasswordView,
    ),
    _i1.RouteDef(
      Routes.profileView,
      page: _i16.ProfileView,
    ),
    _i1.RouteDef(
      Routes.accountView,
      page: _i17.AccountView,
    ),
    _i1.RouteDef(
      Routes.changePasswordView,
      page: _i18.ChangePasswordView,
    ),
    _i1.RouteDef(
      Routes.supportHelpView,
      page: _i19.SupportHelpView,
    ),
    _i1.RouteDef(
      Routes.myOrdersView,
      page: _i20.MyOrdersView,
    ),
    _i1.RouteDef(
      Routes.profileSettingsView,
      page: _i21.ProfileSettingsView,
    ),
    _i1.RouteDef(
      Routes.myDocumentsView,
      page: _i22.MyDocumentsView,
    ),
    _i1.RouteDef(
      Routes.myVehiclesView,
      page: _i23.MyVehiclesView,
    ),
    _i1.RouteDef(
      Routes.editVehicleViewView,
      page: _i24.EditVehicleViewView,
    ),
    _i1.RouteDef(
      Routes.editAddressView,
      page: _i25.EditAddressView,
    ),
    _i1.RouteDef(
      Routes.jobAcceptView,
      page: _i26.JobAcceptView,
    ),
    _i1.RouteDef(
      Routes.rideView,
      page: _i27.RideView,
    ),
    _i1.RouteDef(
      Routes.jobCompletedView,
      page: _i28.JobCompletedView,
    ),
    _i1.RouteDef(
      Routes.orderDetailView,
      page: _i29.OrderDetailView,
    ),
    _i1.RouteDef(
      Routes.onWayView,
      page: _i30.OnWayView,
    ),
    _i1.RouteDef(
      Routes.specificOrderView,
      page: _i31.SpecificOrderView,
    ),
    _i1.RouteDef(
      Routes.earningView,
      page: _i32.EarningView,
    ),
    _i1.RouteDef(
      Routes.ratingsView,
      page: _i33.RatingsView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i34.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i34.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.AuthenticationView: (data) {
      return _i34.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.AuthenticationView(),
        settings: data,
      );
    },
    _i5.LoginView: (data) {
      return _i34.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.LoginView(),
        settings: data,
      );
    },
    _i6.SignupView: (data) {
      return _i34.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.SignupView(),
        settings: data,
      );
    },
    _i7.UploadVehicleDetailsView: (data) {
      return _i34.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.UploadVehicleDetailsView(),
        settings: data,
      );
    },
    _i8.IdentityVerificationView: (data) {
      final args = data.getArgs<IdentityVerificationViewArguments>(
        orElse: () => const IdentityVerificationViewArguments(),
      );
      return _i34.MaterialPageRoute<dynamic>(
        builder: (context) => _i8.IdentityVerificationView(
            key: args.key, document: args.document),
        settings: data,
      );
    },
    _i9.AddressView: (data) {
      return _i34.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.AddressView(),
        settings: data,
      );
    },
    _i10.ApprovalView: (data) {
      return _i34.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.ApprovalView(),
        settings: data,
      );
    },
    _i11.MapView: (data) {
      return _i34.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.MapView(),
        settings: data,
      );
    },
    _i12.EmailVerificationView: (data) {
      final args = data.getArgs<EmailVerificationViewArguments>(nullOk: false);
      return _i34.MaterialPageRoute<dynamic>(
        builder: (context) => _i12.EmailVerificationView(
            key: args.key,
            email: args.email,
            isRoutedFromForgotView: args.isRoutedFromForgotView),
        settings: data,
      );
    },
    _i13.NoInternetView: (data) {
      return _i34.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.NoInternetView(),
        settings: data,
      );
    },
    _i14.ForgotPasswordView: (data) {
      return _i34.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.ForgotPasswordView(),
        settings: data,
      );
    },
    _i15.NewPasswordView: (data) {
      final args = data.getArgs<NewPasswordViewArguments>(nullOk: false);
      return _i34.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i15.NewPasswordView(key: args.key, email: args.email),
        settings: data,
      );
    },
    _i16.ProfileView: (data) {
      return _i34.MaterialPageRoute<dynamic>(
        builder: (context) => const _i16.ProfileView(),
        settings: data,
      );
    },
    _i17.AccountView: (data) {
      return _i34.MaterialPageRoute<dynamic>(
        builder: (context) => const _i17.AccountView(),
        settings: data,
      );
    },
    _i18.ChangePasswordView: (data) {
      return _i34.MaterialPageRoute<dynamic>(
        builder: (context) => const _i18.ChangePasswordView(),
        settings: data,
      );
    },
    _i19.SupportHelpView: (data) {
      return _i34.MaterialPageRoute<dynamic>(
        builder: (context) => const _i19.SupportHelpView(),
        settings: data,
      );
    },
    _i20.MyOrdersView: (data) {
      return _i34.MaterialPageRoute<dynamic>(
        builder: (context) => const _i20.MyOrdersView(),
        settings: data,
      );
    },
    _i21.ProfileSettingsView: (data) {
      return _i34.MaterialPageRoute<dynamic>(
        builder: (context) => const _i21.ProfileSettingsView(),
        settings: data,
      );
    },
    _i22.MyDocumentsView: (data) {
      return _i34.MaterialPageRoute<dynamic>(
        builder: (context) => const _i22.MyDocumentsView(),
        settings: data,
      );
    },
    _i23.MyVehiclesView: (data) {
      return _i34.MaterialPageRoute<dynamic>(
        builder: (context) => const _i23.MyVehiclesView(),
        settings: data,
      );
    },
    _i24.EditVehicleViewView: (data) {
      final args = data.getArgs<EditVehicleViewViewArguments>(nullOk: false);
      return _i34.MaterialPageRoute<dynamic>(
        builder: (context) => _i24.EditVehicleViewView(
            key: args.key, vehicleObject: args.vehicleObject),
        settings: data,
      );
    },
    _i25.EditAddressView: (data) {
      return _i34.MaterialPageRoute<dynamic>(
        builder: (context) => const _i25.EditAddressView(),
        settings: data,
      );
    },
    _i26.JobAcceptView: (data) {
      return _i34.MaterialPageRoute<dynamic>(
        builder: (context) => const _i26.JobAcceptView(),
        settings: data,
      );
    },
    _i27.RideView: (data) {
      final args = data.getArgs<RideViewArguments>(
        orElse: () => const RideViewArguments(),
      );
      return _i34.MaterialPageRoute<dynamic>(
        builder: (context) => _i27.RideView(key: args.key, order: args.order),
        settings: data,
      );
    },
    _i28.JobCompletedView: (data) {
      final args = data.getArgs<JobCompletedViewArguments>(nullOk: false);
      return _i34.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i28.JobCompletedView(key: args.key, earnings: args.earnings),
        settings: data,
      );
    },
    _i29.OrderDetailView: (data) {
      final args = data.getArgs<OrderDetailViewArguments>(nullOk: false);
      return _i34.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i29.OrderDetailView(key: args.key, order: args.order),
        settings: data,
      );
    },
    _i30.OnWayView: (data) {
      final args = data.getArgs<OnWayViewArguments>(nullOk: false);
      return _i34.MaterialPageRoute<dynamic>(
        builder: (context) => _i30.OnWayView(key: args.key, order: args.order),
        settings: data,
      );
    },
    _i31.SpecificOrderView: (data) {
      final args = data.getArgs<SpecificOrderViewArguments>(nullOk: false);
      return _i34.MaterialPageRoute<dynamic>(
        builder: (context) => _i31.SpecificOrderView(
            key: args.key,
            order: args.order,
            isRouteFromRide: args.isRouteFromRide),
        settings: data,
      );
    },
    _i32.EarningView: (data) {
      return _i34.MaterialPageRoute<dynamic>(
        builder: (context) => const _i32.EarningView(),
        settings: data,
      );
    },
    _i33.RatingsView: (data) {
      return _i34.MaterialPageRoute<dynamic>(
        builder: (context) => const _i33.RatingsView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class IdentityVerificationViewArguments {
  const IdentityVerificationViewArguments({
    this.key,
    this.document,
  });

  final _i34.Key? key;

  final _i35.Document? document;

  @override
  String toString() {
    return '{"key": "$key", "document": "$document"}';
  }

  @override
  bool operator ==(covariant IdentityVerificationViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.document == document;
  }

  @override
  int get hashCode {
    return key.hashCode ^ document.hashCode;
  }
}

class EmailVerificationViewArguments {
  const EmailVerificationViewArguments({
    this.key,
    required this.email,
    this.isRoutedFromForgotView = false,
  });

  final _i34.Key? key;

  final String email;

  final bool isRoutedFromForgotView;

  @override
  String toString() {
    return '{"key": "$key", "email": "$email", "isRoutedFromForgotView": "$isRoutedFromForgotView"}';
  }

  @override
  bool operator ==(covariant EmailVerificationViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.email == email &&
        other.isRoutedFromForgotView == isRoutedFromForgotView;
  }

  @override
  int get hashCode {
    return key.hashCode ^ email.hashCode ^ isRoutedFromForgotView.hashCode;
  }
}

class NewPasswordViewArguments {
  const NewPasswordViewArguments({
    this.key,
    required this.email,
  });

  final _i34.Key? key;

  final String email;

  @override
  String toString() {
    return '{"key": "$key", "email": "$email"}';
  }

  @override
  bool operator ==(covariant NewPasswordViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.email == email;
  }

  @override
  int get hashCode {
    return key.hashCode ^ email.hashCode;
  }
}

class EditVehicleViewViewArguments {
  const EditVehicleViewViewArguments({
    this.key,
    required this.vehicleObject,
  });

  final _i34.Key? key;

  final _i36.VehicleObject vehicleObject;

  @override
  String toString() {
    return '{"key": "$key", "vehicleObject": "$vehicleObject"}';
  }

  @override
  bool operator ==(covariant EditVehicleViewViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.vehicleObject == vehicleObject;
  }

  @override
  int get hashCode {
    return key.hashCode ^ vehicleObject.hashCode;
  }
}

class RideViewArguments {
  const RideViewArguments({
    this.key,
    this.order,
  });

  final _i34.Key? key;

  final _i37.OrderModel? order;

  @override
  String toString() {
    return '{"key": "$key", "order": "$order"}';
  }

  @override
  bool operator ==(covariant RideViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.order == order;
  }

  @override
  int get hashCode {
    return key.hashCode ^ order.hashCode;
  }
}

class JobCompletedViewArguments {
  const JobCompletedViewArguments({
    this.key,
    required this.earnings,
  });

  final _i34.Key? key;

  final String earnings;

  @override
  String toString() {
    return '{"key": "$key", "earnings": "$earnings"}';
  }

  @override
  bool operator ==(covariant JobCompletedViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.earnings == earnings;
  }

  @override
  int get hashCode {
    return key.hashCode ^ earnings.hashCode;
  }
}

class OrderDetailViewArguments {
  const OrderDetailViewArguments({
    this.key,
    required this.order,
  });

  final _i34.Key? key;

  final _i37.OrderModel? order;

  @override
  String toString() {
    return '{"key": "$key", "order": "$order"}';
  }

  @override
  bool operator ==(covariant OrderDetailViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.order == order;
  }

  @override
  int get hashCode {
    return key.hashCode ^ order.hashCode;
  }
}

class OnWayViewArguments {
  const OnWayViewArguments({
    this.key,
    required this.order,
  });

  final _i34.Key? key;

  final _i37.OrderModel? order;

  @override
  String toString() {
    return '{"key": "$key", "order": "$order"}';
  }

  @override
  bool operator ==(covariant OnWayViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.order == order;
  }

  @override
  int get hashCode {
    return key.hashCode ^ order.hashCode;
  }
}

class SpecificOrderViewArguments {
  const SpecificOrderViewArguments({
    this.key,
    required this.order,
    this.isRouteFromRide = false,
  });

  final _i34.Key? key;

  final _i37.OrderModel order;

  final bool isRouteFromRide;

  @override
  String toString() {
    return '{"key": "$key", "order": "$order", "isRouteFromRide": "$isRouteFromRide"}';
  }

  @override
  bool operator ==(covariant SpecificOrderViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.order == order &&
        other.isRouteFromRide == isRouteFromRide;
  }

  @override
  int get hashCode {
    return key.hashCode ^ order.hashCode ^ isRouteFromRide.hashCode;
  }
}

extension NavigatorStateExtension on _i38.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAuthenticationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.authenticationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUploadVehicleDetailsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.uploadVehicleDetailsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToIdentityVerificationView({
    _i34.Key? key,
    _i35.Document? document,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.identityVerificationView,
        arguments:
            IdentityVerificationViewArguments(key: key, document: document),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddressView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.addressView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToApprovalView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.approvalView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMapView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.mapView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEmailVerificationView({
    _i34.Key? key,
    required String email,
    bool isRoutedFromForgotView = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.emailVerificationView,
        arguments: EmailVerificationViewArguments(
            key: key,
            email: email,
            isRoutedFromForgotView: isRoutedFromForgotView),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNoInternetView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.noInternetView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToForgotPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.forgotPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNewPasswordView({
    _i34.Key? key,
    required String email,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.newPasswordView,
        arguments: NewPasswordViewArguments(key: key, email: email),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAccountView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.accountView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChangePasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.changePasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSupportHelpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.supportHelpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMyOrdersView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.myOrdersView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProfileSettingsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.profileSettingsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMyDocumentsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.myDocumentsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMyVehiclesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.myVehiclesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEditVehicleViewView({
    _i34.Key? key,
    required _i36.VehicleObject vehicleObject,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.editVehicleViewView,
        arguments: EditVehicleViewViewArguments(
            key: key, vehicleObject: vehicleObject),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEditAddressView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.editAddressView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToJobAcceptView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.jobAcceptView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRideView({
    _i34.Key? key,
    _i37.OrderModel? order,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.rideView,
        arguments: RideViewArguments(key: key, order: order),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToJobCompletedView({
    _i34.Key? key,
    required String earnings,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.jobCompletedView,
        arguments: JobCompletedViewArguments(key: key, earnings: earnings),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOrderDetailView({
    _i34.Key? key,
    required _i37.OrderModel? order,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.orderDetailView,
        arguments: OrderDetailViewArguments(key: key, order: order),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOnWayView({
    _i34.Key? key,
    required _i37.OrderModel? order,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.onWayView,
        arguments: OnWayViewArguments(key: key, order: order),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSpecificOrderView({
    _i34.Key? key,
    required _i37.OrderModel order,
    bool isRouteFromRide = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.specificOrderView,
        arguments: SpecificOrderViewArguments(
            key: key, order: order, isRouteFromRide: isRouteFromRide),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEarningView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.earningView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRatingsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.ratingsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAuthenticationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.authenticationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.signupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithUploadVehicleDetailsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.uploadVehicleDetailsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithIdentityVerificationView({
    _i34.Key? key,
    _i35.Document? document,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.identityVerificationView,
        arguments:
            IdentityVerificationViewArguments(key: key, document: document),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddressView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.addressView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithApprovalView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.approvalView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMapView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.mapView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEmailVerificationView({
    _i34.Key? key,
    required String email,
    bool isRoutedFromForgotView = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.emailVerificationView,
        arguments: EmailVerificationViewArguments(
            key: key,
            email: email,
            isRoutedFromForgotView: isRoutedFromForgotView),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNoInternetView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.noInternetView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithForgotPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.forgotPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNewPasswordView({
    _i34.Key? key,
    required String email,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.newPasswordView,
        arguments: NewPasswordViewArguments(key: key, email: email),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAccountView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.accountView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChangePasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.changePasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSupportHelpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.supportHelpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMyOrdersView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.myOrdersView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProfileSettingsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.profileSettingsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMyDocumentsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.myDocumentsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMyVehiclesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.myVehiclesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEditVehicleViewView({
    _i34.Key? key,
    required _i36.VehicleObject vehicleObject,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.editVehicleViewView,
        arguments: EditVehicleViewViewArguments(
            key: key, vehicleObject: vehicleObject),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEditAddressView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.editAddressView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithJobAcceptView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.jobAcceptView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRideView({
    _i34.Key? key,
    _i37.OrderModel? order,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.rideView,
        arguments: RideViewArguments(key: key, order: order),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithJobCompletedView({
    _i34.Key? key,
    required String earnings,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.jobCompletedView,
        arguments: JobCompletedViewArguments(key: key, earnings: earnings),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOrderDetailView({
    _i34.Key? key,
    required _i37.OrderModel? order,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.orderDetailView,
        arguments: OrderDetailViewArguments(key: key, order: order),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOnWayView({
    _i34.Key? key,
    required _i37.OrderModel? order,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.onWayView,
        arguments: OnWayViewArguments(key: key, order: order),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSpecificOrderView({
    _i34.Key? key,
    required _i37.OrderModel order,
    bool isRouteFromRide = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.specificOrderView,
        arguments: SpecificOrderViewArguments(
            key: key, order: order, isRouteFromRide: isRouteFromRide),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEarningView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.earningView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRatingsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.ratingsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
