import 'package:flutter/material.dart';
import 'package:flutter_app/model/languages.dart';

class ListViewLanguages extends StatelessWidget {
  final List<Languages> data;
  ListViewLanguages({this.data, Key key}) : super(key: key);
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
                Text('languages: ${data[index].iso639_1}'),
                Text('${data[index].iso639_2}'),
                Text('${data[index].name}'),
                Text('${data[index].nativeName}'),
              ],
            );
          }),
    );
  }
}
