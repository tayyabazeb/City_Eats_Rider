// ignore_for_file: avoid_function_literals_in_foreach_calls, library_private_types_in_public_api, use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rider/app/app.locator.dart';
import 'package:rider/constants/asesets.dart';
import 'package:rider/responses/vehicle_type.dart';
import 'package:rider/ui/buttons/custom_elevated_button.dart';
import 'package:rider/ui/common/app_colors.dart';
import 'package:rider/ui/dialogs/progress_indicator/progress.dart';
import 'package:rider/ui/views/upload_vehicle_details/upload_vehicle_details_view.form.dart';
import 'package:rider/ui/widgets/common/custom_text_field/custom_text_field.dart';
import 'package:rider/ui/widgets/validation_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../form_validations/form_validator.dart';
import 'upload_vehicle_details_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(
      name: 'make',
      validator: FormFieldsValidator.validateFieldEmpty,
    ),
    FormTextField(
      name: 'model',
      validator: FormFieldsValidator.validateFieldEmpty,
    ),
    FormTextField(
      name: 'year',
      validator: FormFieldsValidator.validateFieldEmpty,
    ),
    FormTextField(
      name: 'license_plate',
      validator: FormFieldsValidator.validateFieldEmpty,
    ),
    FormTextField(
      name: 'vehicle_color',
      validator: FormFieldsValidator.validateFieldEmpty,
    ),
  ],
)
class UploadVehicleDetailsView
    extends StackedView<UploadVehicleDetailsViewModel>
    with $UploadVehicleDetailsView {
  const UploadVehicleDetailsView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, UploadVehicleDetailsViewModel viewModel,
      Widget? child) {
    return CustomProgressIndicator(
      isLoading: viewModel.isBusy,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Container(
          padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 70.h),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  //
                  locator<NavigationService>().back();
                },
                icon: const Icon(Icons.arrow_back_ios_new),
              ),
              20.verticalSpace,
              Center(
                child: Text(
                  "Upload your vehicle details",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: kcPrimaryColor),
                ),
              ),
              30.verticalSpace,
              Text(
                "Vehicle Images",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontSize: 10.sp),
              ),
              10.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "V5",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontSize: 10.sp),
                        ),
                        InkWell(
                          onTap: () async {
                            XFile? image =
                                await viewModel.getImageFromGallery();
                            if (image != null) {
                              final isSelected = await _showFullScreenImage(
                                  context, File(image.path));
                              if (isSelected ?? false) {
                                viewModel.vehicleDetails.v5Image =
                                    File(image.path);
                                viewModel.rebuildUi();
                              }
                            }
                          },
                          child: Container(
                            height: 112.h,
                            width: 130.w,
                            padding: EdgeInsets.all(10.w),
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage(
                                      "$kcStaticImagesPath/motor.png"),
                                ),
                                border: Border.all(color: kcGreyColor),
                                borderRadius: BorderRadius.circular(10.r)),
                            child: viewModel.vehicleDetails.v5Image != null
                                ? Image.file(File(
                                    viewModel.vehicleDetails.v5Image?.path ??
                                        ""))
                                : Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                        const CircleAvatar(
                                          backgroundColor: kcPrimaryColor,
                                          child:
                                              Icon(Icons.camera_alt_outlined),
                                        ),
                                        Text(
                                          "V5",
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                  fontSize: 12.sp,
                                                  color: kcDarkGreyColor),
                                        ),
                                      ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  20.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "V5",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontSize: 12.sp),
                        ),
                        8.verticalSpace,
                        InkWell(
                          onTap: () async {
                            XFile? image =
                                await viewModel.getImageFromGallery();
                            if (image != null) {
                              final isSelected = await _showFullScreenImage(
                                  context, File(image.path));
                              if (isSelected) {
                                viewModel.vehicleDetails.motImage =
                                    File(image.path);
                                viewModel.rebuildUi();
                              }
                            }
                          },
                          child: Container(
                            height: 112.h,
                            width: 130.w,
                            padding: EdgeInsets.all(10.w),
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage(
                                      "$kcStaticImagesPath/motor.png"),
                                ),
                                border: Border.all(color: kcGreyColor),
                                borderRadius: BorderRadius.circular(10.r)),
                            child: viewModel.vehicleDetails.motImage != null
                                ? Image.file(File(
                                    viewModel.vehicleDetails.motImage?.path ??
                                        ""))
                                : Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                        const CircleAvatar(
                                          backgroundColor: kcPrimaryColor,
                                          child:
                                              Icon(Icons.camera_alt_outlined),
                                        ),
                                        8.verticalSpace,
                                        Text(
                                          "MOT",
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                  fontSize: 12.sp,
                                                  color: kcDarkGreyColor),
                                        ),
                                      ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              5.verticalSpace,
              if (viewModel.isButtonClicked &&
                  (viewModel.vehicleDetails.v5Image == null ||
                      viewModel.vehicleDetails.motImage == null))
                const ValidationWidget(
                    message: "Please select at least 4 vehicle images"),
              if (viewModel.vehicleTypeResponse != null) ...[
                20.verticalSpace,
                Row(
                  children: [
                    VehicleTypeDropdown(
                      list: viewModel.vehicleTypeResponse?.body ?? [],
                      onChanged: (String? newValue) {
                        viewModel.vehicleDetails.vehicleTypeId =
                            int.parse(newValue ?? "");
                        int? index = viewModel.vehicleTypeResponse?.body
                            ?.indexWhere(
                                (element) => element.id.toString() == newValue);
                        viewModel.selectedType =
                            viewModel.vehicleTypeResponse?.body?[index ?? 0];
                        print(newValue);
                      },
                    ),
                    17.horizontalSpace,
                    IconButton(
                      icon: const Icon(Icons.info),
                      onPressed: () {
                        final RenderBox overlay = Overlay.of(context)
                            .context
                            .findRenderObject()! as RenderBox;
                        final RenderBox button =
                            context.findRenderObject()! as RenderBox;
                        final Offset targetGlobal =
                            button.localToGlobal(Offset.zero);

                        showTooltip(
                            context,
                            targetGlobal,
                            viewModel.selectedType?.description ??
                                "Type description");
                      },
                    ),
                  ],
                ),
              ],
              20.verticalSpace,
              Text(
                "Documents of Vehicle",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontSize: 10.sp),
              ),
              10.verticalSpace,
              InkWell(
                onTap: () async {
                  File? documentFile = await viewModel.getDocumentFile();
                  if (documentFile != null) {
                    //
                    // viewModel.vehicleDetails.documents = documentFile;
                    // viewModel.notifyListeners();
                    //
                    final res = await _showPdfFullScreen(context, documentFile);

                    if (res ?? false) {
                      viewModel.updateInsuranceDocumentFile(documentFile);
                    }
                    print(viewModel.vehicleDetails.documents);
                  }
                },
                child: Container(
                  height: 112.h,
                  width: 130.w,
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage("$kcStaticImagesPath/doc.png"),
                      ),
                      border: Border.all(color: kcGreyColor),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: viewModel.isLoading
                      ? const SpinKitFadingCircle(
                          color: kcPrimaryColor, size: 30)
                      : viewModel.vehicleDetails.documents != null
                          ? PDFView(
                              filePath:
                                  viewModel.vehicleDetails.documents!.path,
                              enableSwipe: true,
                              swipeHorizontal: true,
                              autoSpacing: false,
                              pageFling: true,
                              pageSnap: true,
                              // defaultPage: currentPage!,
                              fitPolicy: FitPolicy.BOTH,
                              // if set to true the link is handled in flutter
                              preventLinkNavigation: false,

                              onViewCreated:
                                  (PDFViewController pdfViewController) {
                                // _controller.complete(pdfViewController);
                              },
                              onLinkHandler: (String? uri) {
                                print('goto uri: $uri');
                              },
                              onPageChanged: (int? page, int? total) {
                                print('page change: $page/$total');
                                // setState(() {
                                // currentPage = page;
                                // });
                              },
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                  const CircleAvatar(
                                    backgroundColor: kcPrimaryColor,
                                    child: Icon(Icons.camera_alt_outlined),
                                  ),
                                  Text(
                                    "Upload Documents",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            fontSize: 11.sp,
                                            color: kcDarkGreyColor),
                                  ),
                                ]),
                ),
              ),
              5.verticalSpace,
              if (viewModel.isButtonClicked &&
                  viewModel.vehicleDetails.documents == null)
                const ValidationWidget(
                    message: "Vehicle documents are required"),
              20.verticalSpace,
              Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                    hintText: "MAKE",
                    textCapitalization: TextCapitalization.words,
                    onChanged: (val) {
                      viewModel.vehicleDetails.make = val ?? "";
                    },
                    controller: makeController,
                    focusNode: makeFocusNode,
                  )),
                  20.horizontalSpace,
                  Expanded(
                      child: CustomTextField(
                    hintText: "MODEL",
                    textCapitalization: TextCapitalization.words,
                    onChanged: (val) {
                      viewModel.vehicleDetails.model = val ?? "";
                    },
                    controller: modelController,
                    focusNode: modelFocusNode,
                  )),
                ],
              ),
              if (viewModel.isButtonClicked &&
                  (!viewModel.hasMake || !viewModel.hasModel))
                const ValidationWidget(message: "These field are required"),
              20.verticalSpace,
              Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                    hintText: "YEAR",
                    textCapitalization: TextCapitalization.words,
                    textInputType: TextInputType.datetime,
                    onChanged: (val) {
                      viewModel.vehicleDetails.year = int.parse(val ?? "");
                    },
                    controller: yearController,
                    focusNode: yearFocusNode,
                  )),
                  20.horizontalSpace,
                  Expanded(
                      child: CustomTextField(
                    hintText: "LICENSE PLATE",
                    textCapitalization: TextCapitalization.words,
                    onChanged: (val) {
                      viewModel.vehicleDetails.licensePlate = val ?? "";
                    },
                    controller: licensePlateController,
                    focusNode: licensePlateFocusNode,
                  )),
                ],
              ),
              if (viewModel.isButtonClicked &&
                  (!viewModel.hasYear || !viewModel.hasLicensePlate))
                const ValidationWidget(message: "These field are required"),
              20.verticalSpace,
              CustomTextField(
                hintText: "VEHICLE COLOR",
                textCapitalization: TextCapitalization.words,
                onChanged: (val) {
                  viewModel.vehicleDetails.vehicleColor = val ?? "";
                },
                controller: vehicleColorController,
                focusNode: vehicleColorFocusNode,
              ),
              if (viewModel.isButtonClicked && (!viewModel.hasVehicleColor))
                const ValidationWidget(message: "This field is required"),
              40.verticalSpace,
              CustomElevatedButton(
                  onPressed: () {
                    // print(viewModel.vehicleDetails.documents);
                    print(viewModel.isFormValid);
                    //
                    viewModel.buttonClicked();
                    if ((viewModel.vehicleDetails.v5Image != null &&
                            viewModel.vehicleDetails.motImage != null) &&
                        viewModel.vehicleDetails.documents != null &&
                        viewModel.hasMake &&
                        viewModel.hasModel &&
                        viewModel.hasYear &&
                        viewModel.hasLicensePlate &&
                        viewModel.hasVehicleColor) {
                      viewModel.addVehicleDetails();
                    }
                  },
                  text: "Submit"),
              12.verticalSpace,
            ]),
          ),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(UploadVehicleDetailsViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(UploadVehicleDetailsViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  void showTooltip(BuildContext context, Offset target, String message) {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject()! as RenderBox;

    final RenderBox button = context.findRenderObject()! as RenderBox;

    final Offset targetGlobal =
        button.localToGlobal(Offset.zero, ancestor: overlay);

    final RenderBox overlayBox = overlay;
    final Size screenSize = overlayBox.size;
    const Size tooltipSize = Size(200, 50);
    // Adjust this according to your content size

    double top = targetGlobal.dy + button.size.height + 100; // 10 is padding
    double left = targetGlobal.dx + (button.size.width - tooltipSize.width) / 2;

    if (top + tooltipSize.height > screenSize.height) {
      top = targetGlobal.dy - tooltipSize.height - 10; // 10 is padding
    }

    if (left < 0) {
      left = 0;
    } else if (left + tooltipSize.width > screenSize.width) {
      left = screenSize.width - tooltipSize.width;
    }
    print("top ====> $top");
    print("left ====> $left");

    final OverlayEntry entry = OverlayEntry(
      maintainState: true,
      builder: (context) => Positioned(
        top: 450.h,
        right: 10.w,
        child: Material(
          color: Colors.transparent,
          child: Tooltip(
            message: 'This is some information.',
            child: Container(
              width: tooltipSize.width,
              // height: tooltipSize.height,
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: kcWhitColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: Text(
                  message,
                  style: const TextStyle(color: kcBlackColor),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(entry);
    print("$entry");

    Future.delayed(const Duration(seconds: 3), () {
      entry.remove();
    });
  }

  _showFullScreenImage(BuildContext context, File imageFile) async {
    final res = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            backgroundColor: kcPrimaryColor,
            child: const Icon(Icons.play_arrow),
          ),
          body: Center(child: Image.file(imageFile, fit: BoxFit.cover)),
        ),
      ),
    );
    return res;
  }

  _showPdfFullScreen(BuildContext context, File file) async {
    final res = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: kcPrimaryColor,
            child: const Icon(Icons.play_arrow),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
          body: Center(
            child: PDFView(
              filePath: file.path, // Replace with your PDF file path
              onPageChanged: (int? page, int? total) {},
              onViewCreated: (PDFViewController vc) {},
              onRender: (int? pages) {},
              onError: (error) {},
            ),
          ),
        ),
      ),
    );
    return res;
  }

  @override
  UploadVehicleDetailsViewModel viewModelBuilder(BuildContext context) =>
      UploadVehicleDetailsViewModel();
}

class VehicleTypeDropdown extends StatefulWidget {
  const VehicleTypeDropdown(
      {super.key, required this.list, required this.onChanged});
  final List<VehicleType> list;
  final void Function(String?) onChanged;

  @override
  _VehicleTypeDropdownState createState() => _VehicleTypeDropdownState();
}

class _VehicleTypeDropdownState extends State<VehicleTypeDropdown> {
  String? _selectedItemId;

  // final List<String> _items = [
  //   'Item 1',
  //   'Item 2',
  //   'Item 3',
  //   'Item 4',
  //   'Item 5'
  // ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: false,
      decoration: InputDecoration(
        constraints: BoxConstraints(maxHeight: 50.h, maxWidth: 220.w),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
        border: _inputBorder(context).border,
        focusedBorder: _inputBorder(context).border,
        enabledBorder: _inputBorder(context).border,
        hintText: 'Vehicle Type',
        hintStyle: _inputBorder(context).hintStyle,
        fillColor: kWhiteColor,
      ),
      dropdownColor: kWhiteColor,
      hint: Text(
        'Select a vehicle type',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      value: _selectedItemId,
      onChanged: widget.onChanged,
      items: widget.list.map((VehicleType item) {
        return DropdownMenuItem<String>(
          value: item.id.toString(),
          child: Text(
            item.name ?? "",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        );
      }).toList(),
    );
  }

  InputDecorationTheme _inputBorder(_) =>
      Theme.of(_).inputDecorationTheme.copyWith();
}
