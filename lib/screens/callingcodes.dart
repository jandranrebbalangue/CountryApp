import 'package:flutter/material.dart';

class ListViewCodes extends StatelessWidget {
  final List<String> data;
  ListViewCodes({this.data, Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('calling codes: ${data[index]}'),
              ],
            );
          }),
    );
  }
}
