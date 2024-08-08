import 'package:rider/services/update_profile_response.dart';
import 'package:rider/ui/views/profile_settings/profile_settings_view.form.dart';
import 'package:stacked/stacked.dart';
import 'dart:io';
import 'package:rider/app/app.logger.dart';
import 'package:rider/app/app.router.dart';
import 'package:rider/models/update_profile_body.dart';
import 'package:rider/models/user_profile.dart';
import 'package:rider/services/auth_service.dart';
import 'package:rider/services/database_service.dart';
import 'package:rider/services/filepicker_service.dart';
import 'package:rider/ui/snackbars/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class ProfileSettingsViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _dbService = locator<DatabaseService>();
  final _filePickerService = locator<FilepickerService>();
  final _autService = locator<AuthService>();

  bool profileUpdated = false;
  bool isIsoLoaded = false;
  File? imageFile;

  UserProfile get user => _autService.userProfile!;
  UpdateProfileBody updateProfileBody = UpdateProfileBody();

  final log = getLogger("EditProfileViewModel");

  ProfileSettingsViewModel() {
    initData();
  }

  navigateToChangePassword() {
    _navigationService.navigateToChangePasswordView();
  }

  initData() {
    nameValue = user.name;
    emailValue = user.email;
    phoneValue = user.contactNumber;
    updateProfileBody.name = user.name;
    updateProfileBody.phone = user.contactNumber;
    rebuildUi();
  }

  /// Get image from Gallery
  void getImageFromGallery(BuildContext context) async {
    ///
    // GoRouter.of(context).pop();
    _navigationService.back();
    XFile? pickedFile = await _filePickerService.pickSingleImage();
    if (pickedFile != null) {
      profileUpdated = true;
      imageFile = File(pickedFile.path);
      updateProfileBody.profileImage = imageFile;
    }
    rebuildUi();
  }

  /// Get image from Camera
  void getImageFromCamera(BuildContext context) async {
    _navigationService.back();
    XFile? pickedFile = await ImagePicker()
        .pickImage(source: ImageSource.camera, maxWidth: 1800, maxHeight: 1800);
    if (pickedFile != null) {
      profileUpdated = true;
      imageFile = File(pickedFile.path);
      log.d(imageFile);
      updateProfileBody.profileImage = imageFile;
    }
    rebuildUi();
  }

  updateProfile(context) async {
    setBusy(true);
    UpdateProfileResponse res =
        await _dbService.updateProfile(updateProfileBody);
    if (res.success) {
      _navigationService.back(result: updateProfileBody);
      showSnackBar(context, message: "Profile Updated Successfully");
    } else {
      showSnackBar(context, message: "Profile not updated");
    }
    setBusy(false);
  }
}
