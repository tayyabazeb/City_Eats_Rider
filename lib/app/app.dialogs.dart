// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/account_create/account_create_dialog.dart';
import '../ui/dialogs/error/error_dialog.dart';
import '../ui/dialogs/incomnigrequest/incomnigrequest_dialog.dart';
import '../ui/dialogs/info_alert/info_alert_dialog.dart';
import '../ui/dialogs/no_internet/no_internet_dialog.dart';
import '../ui/dialogs/not_approved/not_approved_dialog.dart';

enum DialogType {
  infoAlert,
  incomnigrequest,
  error,
  accountCreate,
  notApproved,
  noInternet,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.infoAlert: (context, request, completer) =>
        InfoAlertDialog(request: request, completer: completer),
    DialogType.incomnigrequest: (context, request, completer) =>
        IncomnigrequestDialog(request: request, completer: completer),
    DialogType.error: (context, request, completer) =>
        ErrorDialog(request: request, completer: completer),
    DialogType.accountCreate: (context, request, completer) =>
        AccountCreateDialog(request: request, completer: completer),
    DialogType.notApproved: (context, request, completer) =>
        NotApprovedDialog(request: request, completer: completer),
    DialogType.noInternet: (context, request, completer) =>
        NoInternetDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
