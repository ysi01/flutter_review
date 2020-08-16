import 'package:flutter/material.dart';

import 'bTile.dart';
import 'aTile.dart';

class AcoList extends StatefulWidget {
  final List<Map> viewList;
  // String title, Icon icon, List list ,Boolean open, String listType
  // Todo なんか無理矢理感があるのでなおしたい

  AcoList(this.viewList);

  @override
  _AcoListState createState() => _AcoListState();
}

class _AcoListState extends State<AcoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: silvers(),
      ),
    );
  }

  List<Widget> silvers() {
    List<Widget> www = [];
    for (var i = 0; i < widget.viewList.length; i++) {
      www = [
        ...www,
        ...[header(i), lists(i)]
      ];
    }
    return www;
  }

  Widget header(int index) {
    // Todo 自分の子が最後までスクロールされたらいなくなりたい
    return SliverAppBar(
      backgroundColor: Colors.grey[0],
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(widget.viewList[index]['icon']),
          ),
          Text(widget.viewList[index]['title']),
        ],
      ),
      pinned: true,
      actions: <Widget>[
        // Todo 回すアニメーションつけたい
        IconButton(
          onPressed: () {
            setState(() => widget.viewList[index]['open'] =
                !widget.viewList[index]['open']);
          },
          icon: const Icon(Icons.expand_more),
        ),
      ],
    );
  }

  Widget lists(int index) {
    return SliverFixedExtentList(
      delegate: SliverChildListDelegate(
        widget.viewList[index]['open'] == true
            ? List<Widget>.generate(widget.viewList[index]['list'].length,
                (int i) {
                return setListWidget(index, i);
              })
            : <Widget>[],
      ),
      itemExtent: 100, // Todo 可変にしたいが、上から渡すしかないか
    );
  }

  Widget setListWidget(int index, int listIndex) {
    Widget returnWidget;
    switch (widget.viewList[index]['listType']) {
      case 'a':
        // Todo　外から注入できないか
        returnWidget = aTile(widget.viewList[index]['list'][listIndex]);
        break;
      case 'b':
        // Todo　外から注入できないか
        returnWidget = bTile(widget.viewList[index]['list'][listIndex]);
        break;
      default:
        returnWidget = SizedBox.shrink();
    }

    return returnWidget;
  }
}
