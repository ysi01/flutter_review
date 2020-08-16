import 'package:flutter/material.dart';

class HomeModel extends ChangeNotifier {
  List userList = [
    {'title': 'aさん'},
    {'title': 'bさん'},
    {'title': 'cさん'},
  ];

  List groupList = [
    {'title': 'aグループ', 'icon': Icons.access_time},
    {'title': 'bグループ', 'icon': Icons.access_time},
    {'title': 'cグループ', 'icon': Icons.access_time},
    {'title': 'dグループ', 'icon': Icons.access_time},
    {'title': 'eグループ', 'icon': Icons.access_time},
    {'title': 'fグループ', 'icon': Icons.access_time},
    {'title': 'gグループ', 'icon': Icons.access_time},
    {'title': 'hグループ', 'icon': Icons.access_time},
  ];
}
