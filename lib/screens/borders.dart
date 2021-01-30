import 'package:flutter/material.dart';

class ListViewBorders extends StatelessWidget {
  final List<String> data;
  ListViewBorders({this.data, Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('borders:${data[index]}'),
              ],
            );
          }),
    );
  }
}
