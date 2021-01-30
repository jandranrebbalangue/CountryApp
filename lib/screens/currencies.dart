import 'package:flutter/material.dart';
import 'package:flutter_app/model/currencies.dart';

class ListViewCurrencies extends StatelessWidget {
  final List<Currencies> data;
  ListViewCurrencies({this.data, Key key}) : super(key: key);
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
                Text('currencies: ${data[index].code}'),
                Text('${data[index].name}'),
                Text('${data[index].symbol}'),
              ],
            );
          }),
    );
  }
}
