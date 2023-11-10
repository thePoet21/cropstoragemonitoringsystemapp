import 'package:flutter/material.dart';

import '../utils/constants.dart';
import 'custom_icon.dart';

class SettingsCard extends StatelessWidget {
  final String cardName;
  final String iconPath;
  final VoidCallback onTap;
  const SettingsCard(
      {super.key,
      required this.cardName,
      required this.iconPath,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).brightness == Brightness.light
          ? const Color(0xffd3d3d4)
          : const Color(0xff36373b),
      elevation: 0,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ListTile(
            title: Text(
              cardName,
              style: kNormalTextStyle,
            ),
            // trailing: MyIcon(
            //   assetPath: iconPath,
            //   color: Theme.of(context).brightness == Brightness.light
            //       ? Colors.black
            //       : kUnselectedIcon,
            // ),
            // leading: Icon(
            //   Icons.arrow_forward_ios,
            //   color: Theme.of(context).brightness == Brightness.light
            //       ? const Color(0xff232529)
            //       : const Color(0xffe6f4ff),
            //   size: 20,
            // ),
            leading: MyIcon(
              assetPath: iconPath,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : kUnselectedIcon,
            ),
          ),
        ),
      ),
    );
  }
}
