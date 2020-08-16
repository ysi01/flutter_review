import 'package:flutter/material.dart';

Widget aTile(Map list) {
  print(list);
  return Container(
    child: Text(list['title']),
  );
}
