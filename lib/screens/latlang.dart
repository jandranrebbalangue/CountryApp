import 'package:flutter/material.dart';

class ListViewLat extends StatelessWidget {
  final List<double> data;
  ListViewLat({this.data, Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: data.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('latlng:${data[index]}'),
              ],
            );
          }),
    );
  }
}
