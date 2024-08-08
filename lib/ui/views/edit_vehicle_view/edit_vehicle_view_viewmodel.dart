// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rider/app/app.logger.dart';
import 'package:rider/responses/vehicle_type.dart';
import 'package:rider/responses/vehicles_response.dart';
import 'package:rider/ui/snackbars/custom_snackbar.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rider/app/app.dialogs.dart';
import 'package:rider/app/app.locator.dart';
import 'package:rider/models/vehicle_details_body.dart';
import 'package:rider/services/database_service.dart';
import 'package:rider/services/filepicker_service.dart';
import 'dart:io';
import 'package:stacked_services/stacked_services.dart';

class EditVehicleViewViewModel extends FormViewModel {
  final _filePickerService = locator<FilepickerService>();
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _dbService = locator<DatabaseService>();
  final log = getLogger("EditVehicleViewViewModel");
  bool isButtonClicked = false;
  bool makeChanges = false;

// final VehicleObject vehicleObject;
  VehicleDetails vehicleDetails = VehicleDetails(
    // images: [],
    licensePlate: '',
    make: '',
    model: '',
    vehicleColor: '',
    year: 0,
  );

  File? imageFile;

  EditVehicleViewViewModel(VehicleObject vehicleObject) {
    if (vehicleObject.year != null) vehicleDetails.year = vehicleObject.year!;
  }

  VehicleTypeResponse? vehicleTypeResponse;

  Future<void> getVehicleType(vehicleTypeId) async {
    setBusy(true);
    vehicleTypeResponse = await _dbService.getVehicleType();
    if (vehicleTypeResponse?.success ?? false) {
      // navigateToPersonIdentificationView();
      if (vehicleTypeId != null) {
        int? index = vehicleTypeResponse?.body?.indexWhere(
            (element) => element.id.toString() == vehicleTypeId?.toString());
        if (index == -1) {
          selectedType = vehicleTypeResponse?.body?[0];
        } else {
          selectedType = vehicleTypeResponse?.body?[index ?? 0];
        }
      } else {
        selectedType = vehicleTypeResponse?.body?[0];
      }
    } else {
      showDialog(vehicleTypeResponse?.error ?? "");
    }
    setBusy(false);
  }

  /// Get image from Gallery
  Future<XFile?> getImageFromGallery() async {
    XFile? pickedFile = await _filePickerService.pickSingleImage();

    if (pickedFile != null) {
      updateChangesBool();
    }
    return pickedFile;
  }

  updateChangesBool({changes = true}) {
    makeChanges = changes;
    rebuildUi();
  }

  /// Get image from Gallery
  getDocumentFile() async {
    File? file = await _filePickerService.pickPdfFile();
    print(file);
    if (file != null) {
      updateChangesBool();
    }
    return file;
  }

  PDFViewController? oldController;

  updateInsuranceDocumentFile(documentFile) async {
    isLoading = true;
    rebuildUi();
    await Future.delayed(const Duration(seconds: 3));
    vehicleDetails.documents = documentFile;
    log.wtf(vehicleDetails.documents);
    isLoading = false;
    rebuildUi();
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

  back() {
    _navigationService.back();
  }

  Future<void> updateVehicleDetails(context) async {
    log.wtf(vehicleDetails.toJson());
    setBusy(true);
    final res = await _dbService.updateVehicleDetails(vehicleDetails);
    if (res['success']) {
      showSnackBar(context, message: "Vehicle details updated successfully");
      back();
    } else {
      showDialog(res['error'] ?? "");
    }
    setBusy(false);
  }

  // Future showUpdateDialog(String error) async {
  //   await _dialogService.showCustomDialog(
  //     variant: DialogType.error,
  //     title: 'Updated',
  //     description: error,
  //   );
  // }

  buttonClicked() {
    isButtonClicked = true;
    notifyListeners();
  }

  Future showDialog(String error) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Error',
      description: error,
    );
  }

  // updateVehicleImages() async {
  //   XFile? pickedFile = await getImageFromGallery();
  //   print(pickedFile?.length);
  //   // if (pickedFile != null) {
  //   //   vehicleDetails.images = [];
  //   //   for (var element in pickedFile) {
  //   //     vehicleDetails.images.add(File(element.path));
  //   //   }
  //   // }
  //   notifyListeners();
  //   return pickedFile.path;
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

  File? pFile;
  bool isLoading = false;
  VehicleType? selectedType;

  Future<void> loadDocumentInPdf(String url) async {
    isLoading = true;
    // });
    //  var url = 'http://www.pdf995.com/samples/pdf.pdf';
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();
    var file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    pFile = file;

    isLoading = false;
    rebuildUi();
  }
}
