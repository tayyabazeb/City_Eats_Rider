import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rider/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'map_navigation_option_sheet_model.dart';

class MapNavigationOptionSheet
    extends StackedView<MapNavigationOptionSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const MapNavigationOptionSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MapNavigationOptionSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: () {
              viewModel.launchWazNavigation(request.data);
              completer!(SheetResponse(confirmed: true));
            },
            title: Text(
              "Open Waze Application",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          verticalSpaceTiny,
          ListTile(
              onTap: () {
                if(Platform.isIOS){
                viewModel.launchAppleMapsNavigation(request.data);
                }
                else if(Platform.isAndroid){
                  viewModel.launchGoogleMapsNavigation(request.data);
                }
                completer!(SheetResponse(confirmed: true));
              },
              title: Text(
                "Open Google Maps Application",
                style: Theme.of(context).textTheme.bodyMedium,
              )),
        ],
      ),
    );
  
  }

  @override
  MapNavigationOptionSheetModel viewModelBuilder(BuildContext context) =>
      MapNavigationOptionSheetModel();
}


