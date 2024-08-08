import 'dart:io';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rider/app/app.locator.dart';
import 'package:rider/app/app.router.dart';
import 'package:rider/responses/vehicles_response.dart';
import 'package:stacked/stacked.dart';
import 'package:rider/services/database_service.dart';
import 'package:stacked_services/stacked_services.dart';

class MyVehiclesViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _dbService = locator<DatabaseService>();
  VehicleObject vehicleObject = VehicleObject();
  bool isFullScreen = false;

  MyVehiclesViewModel() {
    getDriverLicense();
  }

  getDriverLicense() async {
    setBusy(true);

    VehicleResponse res = await _dbService.fetchMyVehicle();
    if (res.success) {
      //
      if (res.vehicle != null) {
        vehicleObject = res.vehicle!;
        if (vehicleObject.document != null) {
          loadDocumentInPdf(vehicleObject.document ?? "");
        }
        bannerList.clear();
        bannerList.add(vehicleObject.v5Image ?? "");
        bannerList.add(vehicleObject.motImage ?? "");
      }
    } else {
      //show dialog
    }

    setBusy(false);
  }

  PDFViewController? pdfViewController;
  int current = 0;
  int currentPage = 0;
  onPageChange(index) {
    current = index;
    rebuildUi();
  }

  CarouselController controller = CarouselController();
  bool isLoading = false;
  File? pFile;

  Future<void> loadDocumentInPdf(String url) async {
    // setState(() {
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

  navigateToVehicleView() async {
    await _navigationService.navigateToEditVehicleViewView(
        vehicleObject: vehicleObject);
    getDriverLicense();
  }

  List<String> bannerList = [];
}
