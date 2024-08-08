import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rider/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'not_approved_dialog_model.dart';

const double _graphicSize = 60;

class NotApprovedDialog extends StackedView<NotApprovedDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const NotApprovedDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NotApprovedDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Status',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            ),
                      ),
                      // if (request.description != null) ...[
                      14.verticalSpace,
                      Text(
                        "Your Account is not approved by admin yet. Please wait for admin to approve your request",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: kcMediumGrey,
                            ),
                        maxLines: 5,
                        softWrap: true,
                      ),
                    ],
                    // ],
                  ),
                ),
              ],
            ),
            20.verticalSpace,
            GestureDetector(
              onTap: () => completer(DialogResponse(confirmed: true)),
              child: Container(
                height: 50,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: kcPrimaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text('Ok',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: kcWhitColor)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  NotApprovedDialogModel viewModelBuilder(BuildContext context) =>
      NotApprovedDialogModel();
}
