import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review01/model/home_model.dart';
import 'package:review01/parts/aco_list.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeModel>(
      create: (_) => HomeModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('ホーム'),
        ),
        body: Consumer<HomeModel>(
          builder: (context, model, child) {
            List userList = model.userList;
            List groupList = model.groupList;
            return AcoList([
              {
                'title': 'ユーザ',
                'icon': Icons.supervised_user_circle,
                'list': userList,
                'open': false,
                'listType': 'a'
              },
              {
                'title': 'グループ',
                'icon': Icons.group,
                'list': groupList,
                'open': false,
                'listType': 'b'
              }
            ]);
          },
        ),
      ),
    );
  }
}
