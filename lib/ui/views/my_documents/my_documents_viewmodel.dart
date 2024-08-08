import 'package:rider/app/app.locator.dart';
import 'package:rider/app/app.router.dart';
import 'package:rider/responses/documents_response.dart';
import 'package:rider/services/database_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MyDocumentsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _dbService = locator<DatabaseService>();
  Document? document;

  MyDocumentsViewModel() {
    getDriverLicense();
  }

  getDriverLicense() async {
    setBusy(true);
    DocumentsResponse res = await _dbService.fetchMyDocuments();
    if (res.success ?? false) {
      //
      document = res.body;
    } else {
      //show dialog
    }

    setBusy(false);
  }

  navigateToUpdateDocuments() async {
    await _navigationService.navigateToIdentityVerificationView(
        document: document);
    getDriverLicense();
  }
}
