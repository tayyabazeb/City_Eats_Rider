import 'package:rider/app/app.dialogs.dart';
import 'package:rider/app/app.locator.dart';
import 'package:rider/app/app.logger.dart';
import 'package:rider/app/app.router.dart';
import 'package:rider/models/user_profile.dart';
import 'package:rider/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:rider/services/database_service.dart';

class AccountViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  var log = getLogger("AccountViewModel");
  final _dialogService = locator<DialogService>();
  final _dbService = locator<DatabaseService>();
  final _navigationService = locator<NavigationService>();
  get navigationService => _navigationService;
  bool deletionInProgress=false;
  final _autService = locator<AuthService>();
  late UserProfile userProfile =
      userProfile = _autService.userProfile ?? UserProfile.dummyObj();
  UserProfile get user => userProfile;
  AccountViewModel() {
    if (user.id == -1) {
      getProfile();
    }
  }

  getProfile() async {
    if (_autService.userProfile == null) {
      await _authService.doSetup();
      userProfile = _autService.userProfile ?? UserProfile.dummyObj();
    } else {
      userProfile = _autService.userProfile ?? UserProfile.dummyObj();
    }
    rebuildUi();
  }

  navigateToOrders() {
    // _navigationService.navigateToMyOrdersView();
  }

  logout() async {
    setBusy(true);
    await _authService.logout();
    _navigationService.clearStackAndShow(Routes.loginView);
    setBusy(false);
  }

  deleteAccount() async {
    setBusy(true);
    log.d("@deleteAccount");
    // await _authService.logout();
     final res= await _dbService.deleteAccount();
    log.d("delete Response: $res");
    if(res['success']){
      log.d("deleted succesfully");
      await _authService.logout();
      _navigationService.clearStackAndShow(Routes.loginView);
      setBusy(false);
    }
      //
    //
    //
    //
    // }

    // await _authService.logout();



  }

  navigateToEditProfile() async {
    // await _navigationService.navigateToEditProfileView();
    setBusy(true);
    await _autService.doSetup();
    setBusy(false);
    rebuildUi();
  }

  navigateToCartView() {
    // _navigationService.navigateToCartView();
  }

  List<Map<String, dynamic>> list = [
    {"item": "Vehicle Documents", "icon": Icons.car_crash_outlined},
    {"item": "Driving License", "icon": Icons.file_copy},
    {"item": "Address", "icon": Icons.map},
    {"item": "Order History", "icon": Icons.assignment},
    {"item": "Profile Settings", "icon": Icons.settings},
    {"item": "Customer Support", "icon": Icons.support_agent_outlined},
    {"item": "Terms & Conditions", "icon": Icons.privacy_tip_sharp},
    {"item": "Privacy Policy", "icon": Icons.privacy_tip_sharp},
    {"item": "Delete Account", "icon": Icons.delete},
    {"item": "Logout", "icon": Icons.logout},
  ];
  bool get notVerified => checkStatus();

  onItemTap(int index) {
    switch (index) {
      case 0:
        notVerified
            ? showWaitingDialog()
            : _navigationService.navigateToMyVehiclesView();
        break;
      case 1:
        notVerified
            ? showWaitingDialog()
            : _navigationService.navigateToMyDocumentsView();
        break;
      case 2:
        notVerified
            ? showWaitingDialog()
            : _navigationService.navigateToEditAddressView();
        break;
      case 3:
        notVerified
            ? showWaitingDialog()
            : _navigationService.navigateToMyOrdersView();
        break;
      case 4:
        notVerified
            ? showWaitingDialog()
            : _navigationService.navigateToProfileSettingsView();
        break;
      case 5:
        notVerified
            ? showWaitingDialog()
            : _navigationService.navigateToSupportHelpView();
        break;
      case 6:
        termsAndConditions();
        break;
      case 7:
        privacyPolicy();
        break;
      case 8:
        deleteAccount();
        break;
      case 9:
        logout();
        break;
    }
  }

  privacyPolicy() async {
    if (await canLaunchUrl(
        Uri.parse("https://city-eats.co.uk/privacy-policy"))) {
      await launchUrl(Uri.parse("https://city-eats.co.uk/privacy-policy"));
    } else {
      throw 'Could not launch $url';
    }
  }

  termsAndConditions() async {
    if (await canLaunchUrl(
        Uri.parse("https://city-eats.co.uk/terms-and-conditions"))) {
      await launchUrl(
          Uri.parse("https://city-eats.co.uk/terms-and-conditions"));
    } else {
      throw 'Could not launch $url';
    }
  }

  checkStatus() {
    if (_authService.userProfile?.isDocumentsVerified == 0) {
      return true;
    }
    return false;
  }

  showWaitingDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.notApproved,
    );
  }
}

// beyexo9848@trackden.com
// Asdfghjkl112@
