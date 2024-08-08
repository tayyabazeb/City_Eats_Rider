import 'dart:io';
import 'package:rider/app/app.logger.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class FilepickerService {
  final log = getLogger('FilePickerService');
  final FileType _pickingType = FileType.image;
  final ImagePicker imgpicker = ImagePicker();

  Future<List<PlatformFile>?> pickMultipleFiles() async {
    List<PlatformFile>? paths;
    try {
      paths = (await FilePicker.platform.pickFiles(
        type: _pickingType,
        allowMultiple: true,
        onFileLoading: (FilePickerStatus status) => log.i(status),
      ))
          ?.files;
    } on PlatformException catch (e) {
      log.e('Unsupported operation $e');
    } catch (e) {
      log.e(e.toString());
    }

    return paths;
  }

  Future<List<XFile>?> pickMultiImages(
      {int? imageQuality, double? maxHeight, double? maxWidth}) async {
    var pickedfiles = await imgpicker.pickMultiImage(
      imageQuality: imageQuality,
      maxHeight: maxHeight,
      maxWidth: maxWidth,
    );
    List<XFile>? imagefiles = [];

    try {
      // *YOU CAN USE CAMERA FOR IMAGES AS WELL
      if (pickedfiles.isNotEmpty) {
        if (imagefiles.isNotEmpty) {
          imagefiles.addAll(pickedfiles);
        } else {
          imagefiles = pickedfiles;
        }
      } else {
        log.i("No image is selected.");
      }
    } catch (e) {
      log.e('Error Occured: $e');
    }

    return imagefiles;
  }

  Future<XFile?> pickSingleImage({
    ImageSource? imageSource,
    int? imageQuality,
    double? maxHeight,
    double? maxWidth,
  }) async {
    var pickedFile = await imgpicker.pickImage(
      source: imageSource ?? ImageSource.gallery,
      imageQuality: imageQuality,
      maxHeight: maxHeight,
      maxWidth: maxWidth,
    );
    XFile? imageFile;

    try {
      // *YOU CAN USE CAMERA FOR IMAGES AS WELL
      if (pickedFile != null) {
        imageFile = pickedFile;
      } else {
        log.i("No image is selected.");
      }
    } catch (e) {
      log.e('Error Occured: $e');
    }

    return imageFile;
  }

  Future<File?> pickPdfFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        File pdfFile = File(result.files.single.path!);
        return pdfFile;
      } else {
        // User canceled the file picking
        return null;
      }
    } catch (e) {
      print('Error picking PDF file: $e');
      return null;
    }
  }
}
