// Created by Adipt on 29/01/2022

part of '../view.dart';

class ListItem extends StatelessWidget {
  final bool isEnabled;
  final String title;

  const ListItem({
    Key? key,
    required this.isEnabled,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          String.fromCharCode(0x2022),
          style: TextStyle(
            height: 1.2,
            fontSize: 25.0,
              color: (isEnabled) ? QColor.blackColor : Colors.white),
        ),
        Text(
          title,
          style: TextStyle(
              color: (isEnabled) ? QColor.blackColor : Colors.white),
        ),
      ],
    );
  }
}
