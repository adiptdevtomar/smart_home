// Created by Adipt on 29/01/2022

import 'package:flutter/cupertino.dart';
import 'package:smart_home/constants/colors/colors.dart';

class QSwitcher extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;

  const QSwitcher({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: value,
      onChanged: onChanged,
      activeColor: QColor.switchColor,
      trackColor: const Color(0xffa69b93),
    );
  }
}
