import 'package:image_picker/image_picker.dart';
import 'package:rider/responses/documents_response.dart';
import 'package:rider/ui/views/identity_verification/identity_verification_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:rider/app/app.dialogs.dart';
import 'package:rider/app/app.locator.dart';
import 'package:rider/app/app.router.dart';
import 'package:rider/services/database_service.dart';
import 'package:rider/services/filepicker_service.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../models/license_body.dart';

class IdentityVerificationViewModel extends FormViewModel {
  ///
  LicenseBody licenseBody = LicenseBody(
      expiryDate: '', issueDate: '', issuingState: '', licenseNo: '');

  final _filePickerService = locator<FilepickerService>();
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _dbService = locator<DatabaseService>();

  bool isButtonClicked = false;
  File? imageFile;
  bool isUpdate = false;

  Document? document;

  IdentityVerificationViewModel(this.document) {
    if (document != null) {
      isUpdate = true;
      syncData();
      syncControllersData();
    }
  }

  syncData() {
    // licenseBody.frontImage = File(document?.frontImage ?? "");
    // licenseBody.backImage = File(document?.backImage ?? "");
    licenseBody.expiryDate = document?.expiryDate ?? "";
    licenseBody.issueDate = document?.issueDate ?? "";
    licenseBody.licenseNo = document?.licenseNo ?? "";
    licenseBody.issuingState = document?.issuingState ?? "";
    licenseBody.id = document?.id;
    rebuildUi();
  }

  syncControllersData() {
    expiryValue = document?.expiryDate ?? "";
    issueDateValue = document?.issueDate ?? "";
    licenseValue = document?.licenseNo ?? "";
    issuingDateValue = document?.issuingState ?? "";
    rebuildUi();
  }

  buttonClicked() {
    isButtonClicked = true;
    notifyListeners();
  }

  /// Get image from Gallery
  getImageFromGallery(BuildContext context) async {
    XFile? pickedFile = await _filePickerService.pickSingleImage();
   
    return pickedFile;
  }

  back() {
    _navigationService.back();
  }

  navigateToLocationView() {
    _navigationService.navigateToAddressView();
  }

  Future<void> addIdentity() async {
    setBusy(true);
    final res = await _dbService.addIdentity(licenseBody);
    if (res['success'] ?? false) {
      navigateToLocationView();
    } else {
      showDialog(res['error']);
    }
    setBusy(false);
  }

  Future<void> updateIdentity() async {
    setBusy(true);
    final res = await _dbService.updateIdentity(licenseBody);
    if (res['success']) {
      _navigationService.back();
    } else {
      showDialog(res['error']);
    }
    setBusy(false);
  }

  showDialog(String error) {
    _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Error',
      description: error,
    );
  }
}
