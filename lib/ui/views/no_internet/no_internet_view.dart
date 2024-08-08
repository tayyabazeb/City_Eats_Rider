import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'no_internet_viewmodel.dart';

class NoInternetView extends StackedView<NoInternetViewModel> {
  const NoInternetView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NoInternetViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  NoInternetViewModel viewModelBuilder(BuildContext context) =>
      NoInternetViewModel();
}
