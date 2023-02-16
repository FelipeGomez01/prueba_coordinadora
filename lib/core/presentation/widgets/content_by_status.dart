import '../../../config/constants.dart';
import '../../../core/utils/enums/status.dart';
import 'package:flutter/material.dart';
import '../../../theme/theme.dart';
import 'custom_loading.dart';

class ContentByStatus extends StatelessWidget {
  const ContentByStatus({
    Key? key,
    required this.status,
    required this.errorMessage,
    required this.onTryAgain,
    required this.successBuilder
  }) : super(key: key);

  final Status status;
  final String errorMessage;
  final void Function() onTryAgain;
  final Widget Function() successBuilder;

  @override
  Widget build(BuildContext context) {
    if (status.isError) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.work_off, size: 200, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              errorMessage,
              style: AppTheme.textTheme.headline6
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: onTryAgain,
              child: Text(Constants.labels.tryAgain)
            )
          ]
        )
      );
    }

    if (status.isLoading) {
      return const CustomLoading();
    }

    return successBuilder();
  }
}