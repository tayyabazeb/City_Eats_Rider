import 'package:image_picker/image_picker.dart';
import 'package:rider/app/app.dialogs.dart';
import 'package:rider/app/app.locator.dart';
import 'package:rider/app/app.router.dart';
import 'package:rider/models/vehicle_details_body.dart';
import 'package:rider/responses/vehicle_type.dart';
import 'package:rider/services/database_service.dart';
import 'package:rider/services/filepicker_service.dart';
import 'package:stacked/stacked.dart';
import 'dart:io';
import 'package:stacked_services/stacked_services.dart';

class UploadVehicleDetailsViewModel extends FormViewModel {
  final _filePickerService = locator<FilepickerService>();
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _dbService = locator<DatabaseService>();
  bool isButtonClicked = false;

  VehicleDetails vehicleDetails = VehicleDetails(
    licensePlate: '',
    make: '',
    model: '',
    vehicleColor: '',
    year: 0,
    vehicleTypeId: null,
  );

  File? imageFile;

  UploadVehicleDetailsViewModel() {
    getVehicleType();
  }

  /// Get image from Gallery
  Future<XFile?> getImageFromGallery() async {
    XFile? pickedFile = await _filePickerService.pickSingleImage();
    return pickedFile;
  }

  /// Get image from Gallery
  getDocumentFile() async {
    File? documentFile = await _filePickerService.pickPdfFile();
    print(documentFile);
    return documentFile;
  }

  /// Get image from Camera
  // getImageFromCamera(BuildContext context) async {
  //   XFile? pickedFile = await ImagePicker()
  //       .pickImage(source: ImageSource.camera, maxWidth: 1800, maxHeight: 1800);
  //   print(pickedFile?.length);
  //   // if (pickedFile != null) {
  //   //   profileUpdated = true;
  //   //   imageFile = File(pickedFile.path);
  //   //   return imageFile;
  //   // }
  //   rebuildUi();
  // }

  navigateToPersonIdentificationView() {
    _navigationService.navigateToIdentityVerificationView();
  }

  bool isLoading = false;
  updateInsuranceDocumentFile(documentFile) async {
    isLoading = true;
    rebuildUi();
    await Future.delayed(const Duration(seconds: 3));
    vehicleDetails.documents = documentFile;
    isLoading = false;
    rebuildUi();
  }

  Future<void> addVehicleDetails() async {
    setBusy(true);
    final res = await _dbService.addVehicleDetails(vehicleDetails);
    if (res['success']) {
      navigateToPersonIdentificationView();
    } else {
      showDialog(res['error']);
    }
    setBusy(false);
  }

  VehicleType? selectedType;
  VehicleTypeResponse? vehicleTypeResponse;

  Future<void> getVehicleType() async {
    setBusy(true);
    vehicleTypeResponse = await _dbService.getVehicleType();
    if (vehicleTypeResponse?.success ?? false) {
      // navigateToPersonIdentificationView();
    } else {
      showDialog(vehicleTypeResponse?.error ?? "");
    }
    setBusy(false);
  }

  buttonClicked() {
    isButtonClicked = true;
    notifyListeners();
  }

  showDialog(String error) {
    _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Error',
      description: error,
    );
  }

  // updateVehicleImages() async {
  //   List<XFile>? pickedFile = await getImageFromGallery();
  //   print(pickedFile?.length);
  //   if (pickedFile != null) {
  //     vehicleDetails.images = [];
  //     for (var element in pickedFile) {
  //       vehicleDetails.images.add(File(element.path));
  //     }
  //   }
  //   notifyListeners();
  // }

  // updateVehicleDocuments() async {
  //   List<PlatformFile>? pickedFile = await getImageFromGallery();
  //   print(pickedFile?.length);
  //   if (pickedFile != null) {
  //     vehicleDetails.documents = [];
  //     for (var element in pickedFile) {
  //       vehicleDetails.documents.add(File(element.path!));
  //     }
  //   }
  //   notifyListeners();
  // }
}
