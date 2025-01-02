import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'screensizecheck_viewmodel.dart';

class ScreensizecheckView extends StackedView<ScreensizecheckViewModel> {
  const ScreensizecheckView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ScreensizecheckViewModel viewModel,
    Widget? child,
  ) {
    // Get the screen width and height using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Print the screen size to the console
    print('Screen Width: $screenWidth');
    print('Screen Height: $screenHeight');

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Screen Width: ${screenWidth.toStringAsFixed(2)} px',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Screen Height: ${screenHeight.toStringAsFixed(2)} px',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ScreensizecheckViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ScreensizecheckViewModel();
}
