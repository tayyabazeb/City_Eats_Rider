// ignore_for_file: avoid_function_literals_in_foreach_calls, library_private_types_in_public_api, use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rider/constants/asesets.dart';
import 'package:rider/responses/vehicle_type.dart';
import 'package:rider/ui/buttons/custom_elevated_button.dart';
import 'package:rider/ui/common/app_colors.dart';
import 'package:rider/ui/dialogs/progress_indicator/progress.dart';
import 'package:rider/ui/views/edit_vehicle_view/edit_vehicle_view_view.form.dart';
import 'package:rider/ui/widgets/common/custom_text_field/custom_text_field.dart';
import 'package:rider/ui/widgets/validation_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:rider/responses/vehicles_response.dart';
import 'package:rider/ui/form_validations/form_validator.dart';
import 'package:stacked/stacked_annotations.dart';
import 'edit_vehicle_view_viewmodel.dart';

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
class EditVehicleViewView extends StackedView<EditVehicleViewViewModel>
    with $EditVehicleViewView {
  const EditVehicleViewView({Key? key, required this.vehicleObject})
      : super(key: key);
  final VehicleObject vehicleObject;

  @override
  Widget builder(
      BuildContext context, EditVehicleViewViewModel viewModel, Widget? child) {
    return CustomProgressIndicator(
      isLoading: viewModel.isBusy,
      child: WillPopScope(
        onWillPop: () async {
          bool? shouldPop = !viewModel.makeChanges
              ? true
              : await showDialog<bool>(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        'Discard Changes',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      content: Text(
                        'Are you sure you want to discard changes?',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, true);
                          },
                          child: Text(
                            'Yes',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: kcBlackColor),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                          child: Text(
                            'No',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: Colors.red),
                          ),
                        ),
                      ],
                    );
                  },
                );
          return shouldPop ?? true;
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: Container(
            padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 70.h),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () async {
                        bool? shouldPop = !viewModel.makeChanges
                            ? true
                            : await showDialog<bool>(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      'Discard Changes',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    content: Text(
                                      'Are you sure you want to discard changes?',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context, true);
                                        },
                                        child: Text(
                                          'Yes',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(color: kcBlackColor),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context, false);
                                        },
                                        child: Text(
                                          'No',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(color: Colors.red),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );

                        if (shouldPop ?? false) {
                          viewModel.back();
                        }
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
                                    ?.copyWith(fontSize: 12.sp),
                              ),
                              8.verticalSpace,
                              InkWell(
                                onTap: () async {
                                  XFile? image =
                                      await viewModel.getImageFromGallery();
                                  if (image != null) {
                                    final isSelected =
                                        await _showFullScreenImage(
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
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  child: viewModel.vehicleDetails.v5Image !=
                                          null
                                      ? Image.file(File(viewModel
                                              .vehicleDetails.v5Image?.path ??
                                          ""))
                                      : vehicleObject.v5Image != null
                                          ? Image.network(
                                              vehicleObject.v5Image ?? "")
                                          : Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                  const CircleAvatar(
                                                    backgroundColor:
                                                        kcPrimaryColor,
                                                    child: Icon(Icons
                                                        .camera_alt_outlined),
                                                  ),
                                                  Text(
                                                    "V5",
                                                    textAlign: TextAlign.center,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium
                                                        ?.copyWith(
                                                            fontSize: 12.sp,
                                                            color:
                                                                kcDarkGreyColor),
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
                                "MOT",
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
                                    final isSelected =
                                        await _showFullScreenImage(
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
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  child: viewModel.vehicleDetails.motImage !=
                                          null
                                      ? Image.file(File(viewModel
                                              .vehicleDetails.motImage?.path ??
                                          ""))
                                      : vehicleObject.motImage != null
                                          ? Image.network(
                                              vehicleObject.motImage ?? "")
                                          : Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                  const CircleAvatar(
                                                    backgroundColor:
                                                        kcPrimaryColor,
                                                    child: Icon(Icons
                                                        .camera_alt_outlined),
                                                  ),
                                                  Text(
                                                    "MOT",
                                                    textAlign: TextAlign.center,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium
                                                        ?.copyWith(
                                                            fontSize: 12.sp,
                                                            color:
                                                                kcDarkGreyColor),
                                                  ),
                                                ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // 5.verticalSpace,
                    // if (viewModel.isButtonClicked &&
                    //     viewModel.vehicleDetails.images.length < 4)
                    //   const ValidationWidget(
                    //       message: "Please select at least 4 vehicle images"),
                    20.verticalSpace,
                    Text(
                      "Vehicle type",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontSize: 10.sp),
                    ),
                    // 10.verticalSpace,
                    if (viewModel.vehicleTypeResponse != null &&
                        viewModel.vehicleTypeResponse?.body != null) ...[
                      20.verticalSpace,
                      Row(
                        children: [
                          VehicleTypeDropdown(
                            list: viewModel.vehicleTypeResponse?.body ?? [],
                            onChanged: (String? newValue) {
                              viewModel.vehicleDetails.vehicleTypeId =
                                  int.parse(newValue ?? "");
                              int? index = viewModel.vehicleTypeResponse?.body
                                  ?.indexWhere((element) =>
                                      element.id.toString() == newValue);
                              viewModel.selectedType = viewModel
                                  .vehicleTypeResponse?.body?[index ?? 0];
                              if (vehicleObject.vehicleTypeId !=
                                  viewModel.selectedType?.id) {
                                viewModel.updateChangesBool();
                              } else {
                                // viewModel.updateChangesBool(false);
                              }
                            },
                            // onChanged: (String? newValue) {
                            //   viewModel.vehicleDetails.vehicleTypeId =
                            //       int.parse(newValue ?? "");
                            //   print(newValue);
                            // },
                            // selectedItemId:
                            //     ((viewModel.vehicleTypeResponse?.body ?? []).first.id)
                            //         .toString(),
                            selectedItemId:
                                viewModel.selectedType?.id.toString() ??
                                    ((viewModel.vehicleTypeResponse?.body ?? [])
                                            .first
                                            .id)
                                        .toString(),
                          ),
                          17.horizontalSpace,
                          IconButton(
                            icon: const Icon(Icons.info),
                            onPressed: () {
                              // final RenderBox overlay = Overlay.of(context)
                              //     .context
                              //     .findRenderObject()! as RenderBox;
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
                    GestureDetector(
                      onTap: () async {
                        File? documentFile = await viewModel.getDocumentFile();
                        if (documentFile != null) {
                          //
                          final res =
                              await _showPdfFullScreen(context, documentFile);
                        
                          if (res ?? false) {
                            viewModel.updateInsuranceDocumentFile(documentFile);
                            // viewModel.vehicleDetails.documents = documentFile;
                            // viewModel.rebuildUi();
                          }
                         
                        }
                      },
                      child: viewModel.vehicleDetails.documents != null
                          ? Container(
                              height: 112.h,
                              width: 130.w,
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                  border: Border.all(color: kcGreyColor),
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: viewModel.isLoading
                                  ? const SpinKitFadingCircle(
                                      color: kcPrimaryColor, size: 30)
                                  : PDFView(
                                      filePath: viewModel
                                          .vehicleDetails.documents?.path,
                                      fitPolicy: FitPolicy.BOTH,
                                      onViewCreated: (pdfViewController) {
                                        // viewModel.oldController = controller;
                                        viewModel.oldController =
                                            pdfViewController;
                                      },
                                    ))
                          : Container(
                              height: 112.h,
                              width: 130.w,
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                  border: Border.all(color: kcGreyColor),
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: viewModel.isLoading
                                  ? const SpinKitFadingCircle(
                                      color: kcPrimaryColor, size: 30)
                                  : PDFView(
                                      filePath: viewModel.pFile?.path,
                                      fitPolicy: FitPolicy.BOTH,
                                      onViewCreated: (pdfViewController) {
                                        // viewModel.oldController = controller;
                                        viewModel.oldController =
                                            pdfViewController;
                                      },
                                    ),
                            ),
                    ),

                    // 5.verticalSpace,
                    // if (viewModel.isButtonClicked &&
                    //     viewModel.vehicleDetails.documents == null)
                    //   const ValidationWidget(
                    //       message: "Vehicle documents are required"),
                    20.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Make",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(fontSize: 12.sp)),
                            8.verticalSpace,
                            CustomTextField(
                              hintText: "MAKE",
                              textCapitalization: TextCapitalization.words,
                              onChanged: (val) {
                                viewModel.vehicleDetails.make = val ?? "";
                                viewModel.updateChangesBool();
                              },
                              controller: makeController,
                              focusNode: makeFocusNode,
                            ),
                          ],
                        )),
                        20.horizontalSpace,
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Model",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(fontSize: 12.sp)),
                            8.verticalSpace,
                            CustomTextField(
                              hintText: "MODEL",
                              textCapitalization: TextCapitalization.words,
                              onChanged: (val) {
                                viewModel.vehicleDetails.model = val ?? "";
                                viewModel.updateChangesBool();
                              },
                              controller: modelController,
                              focusNode: modelFocusNode,
                            ),
                          ],
                        )),
                      ],
                    ),
                    if (viewModel.isButtonClicked &&
                        (!viewModel.hasMake || !viewModel.hasModel))
                      const ValidationWidget(
                          message: "These field are required"),
                    20.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Year",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(fontSize: 12.sp)),
                            8.verticalSpace,
                            CustomTextField(
                              hintText: "YEAR",
                              textInputType: TextInputType.datetime,
                              onChanged: (val) {
                                viewModel.vehicleDetails.year =
                                    int.parse(val ?? "");
                                viewModel.updateChangesBool();
                              },
                              controller: yearController,
                              focusNode: yearFocusNode,
                            ),
                          ],
                        )),
                        20.horizontalSpace,
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("License Plate",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(fontSize: 12.sp)),
                            8.verticalSpace,
                            CustomTextField(
                              hintText: "LICENSE PLATE",
                              textCapitalization: TextCapitalization.words,
                              onChanged: (val) {
                                viewModel.vehicleDetails.licensePlate =
                                    val ?? "";
                                viewModel.updateChangesBool();
                              },
                              controller: licensePlateController,
                              focusNode: licensePlateFocusNode,
                            ),
                          ],
                        )),
                      ],
                    ),
                    if (viewModel.isButtonClicked &&
                        (!viewModel.hasYear || !viewModel.hasLicensePlate))
                      const ValidationWidget(
                          message: "These field are required"),
                    20.verticalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Vehicle Color",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontSize: 12.sp)),
                        8.verticalSpace,
                        CustomTextField(
                          hintText: "VEHICLE COLOR",
                          onChanged: (val) {
                            viewModel.vehicleDetails.vehicleColor = val ?? "";
                            viewModel.updateChangesBool();
                          },
                          controller: vehicleColorController,
                          focusNode: vehicleColorFocusNode,
                        ),
                      ],
                    ),
                    if (viewModel.isButtonClicked &&
                        (!viewModel.hasVehicleColor))
                      const ValidationWidget(message: "This field is required"),
                    40.verticalSpace,
                    CustomElevatedButton(
                        onPressed: () {
                          //
                          viewModel.buttonClicked();
                          if (
                              // viewModel.vehicleDetails.images.length > 3 &&
                              //   viewModel.vehicleDetails.documents != null &&
                              viewModel.hasMake &&
                                  viewModel.hasModel &&
                                  viewModel.hasYear &&
                                  viewModel.hasLicensePlate &&
                                  viewModel.hasVehicleColor) {
                            viewModel.updateVehicleDetails(context);
                          }
                        },
                        text: "Submit"),
                    12.verticalSpace,
                  ]),
            ),
          ),
        ),
      ),
    );
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

    final OverlayEntry entry = OverlayEntry(
      maintainState: true,
      builder: (context) => Positioned(
        top: 460.h,
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

    Future.delayed(const Duration(seconds: 3), () {
      entry.remove();
    });
  }

  @override
  void onViewModelReady(EditVehicleViewViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    syncData();
    viewModel.getVehicleType(vehicleObject.vehicleTypeId);
    viewModel.loadDocumentInPdf(vehicleObject.document ?? "");
    super.onViewModelReady(viewModel);
  }

  syncData() {
    makeController.text = vehicleObject.make ?? "";
    modelController.text = vehicleObject.model ?? "";
    yearController.text = (vehicleObject.year ?? "").toString();
    licensePlateController.text = vehicleObject.licensePlate ?? "";
    vehicleColorController.text = vehicleObject.color ?? "";
  }

  @override
  void onDispose(EditVehicleViewViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  EditVehicleViewViewModel viewModelBuilder(BuildContext context) =>
      EditVehicleViewViewModel(vehicleObject);
}

class VehicleTypeDropdown extends StatefulWidget {
  const VehicleTypeDropdown(
      {super.key,
      required this.list,
      required this.onChanged,
      required this.selectedItemId});
  final List<VehicleType> list;
  final String selectedItemId;
  final void Function(String?) onChanged;

  @override
  _VehicleTypeDropdownState createState() => _VehicleTypeDropdownState();
}

class _VehicleTypeDropdownState extends State<VehicleTypeDropdown> {
  // String? _selectedItemId;

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
      isExpanded: true,
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
      value: widget.selectedItemId,
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
