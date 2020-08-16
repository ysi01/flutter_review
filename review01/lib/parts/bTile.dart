import 'package:flutter/material.dart';

Widget bTile(Map list) {
  return Container(
    child: Row(
      children: [Text(list['title']), Icon(list['icon'])],
    ),
  );
}
