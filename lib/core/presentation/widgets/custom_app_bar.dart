import 'package:flutter/material.dart';
import '../../../config/constants.dart';
import '../../../theme/theme.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Constants.assetsUrl.iconAppBar,height: 20),
            const SizedBox(height: 8),
            Text(
              Constants.labels.courierPackagesMerchandise,
              style: AppTheme.textTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.w900
              )
            )
          ]
        )
      ),
      iconTheme: const IconThemeData(
        color: Colors.black
      ),
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20)
        )
      ),
      actions: [
        IconButton(
          onPressed: (){}, icon: const Icon(Icons.menu,color: Colors.black)
        )
      ]
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}