import 'package:flutter/material.dart';
import '../../../config/constants.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(image: AssetImage(Constants.assetsUrl.loader));
  }
}