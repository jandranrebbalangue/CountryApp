import 'package:flutter/material.dart';
import 'package:flutter_app/screens/borders.dart';
import 'package:flutter_app/screens/callingcodes.dart';
import 'package:flutter_app/screens/currencies.dart';
import 'package:flutter_app/screens/languages.dart';
import 'package:flutter_app/screens/latlang.dart';
import 'package:flutter_app/services/countriesprovider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter"),
        ),
        body: Container(
            child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: TextField(
                autofocus: false,
                decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                onChanged: (value) {
                  Provider.of<CountriesProvider>(context, listen: false)
                      .changeSearchString(value);
                },
              ),
            ),
          ),
          Consumer<CountriesProvider>(builder: (context, data, child) {
            return Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: data.countries.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          child: ListTile(
                            title: Text(data.countries[index].country),
                            leading: ConstrainedBox(
                              constraints: BoxConstraints(
                                  minWidth: 60,
                                  minHeight: 60,
                                  maxHeight: 75,
                                  maxWidth: 75),
                              child: SvgPicture.network(
                                data.data[index].flag,
                                width: double.maxFinite,
                                semanticsLabel: data.data[index].country,
                                fit: BoxFit.contain,
                              ),
                            ),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                      content: Container(
                                          width: double.maxFinite,
                                          child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Expanded(
                                                  child: ListView(children: [
                                                    Text(
                                                        'capital: ${data.data[index].capital}'),
                                                    Text(
                                                        'region: ${data.data[index].region}'),
                                                    ListViewCodes(
                                                      data: data
                                                          .data[index].codes,
                                                    ),
                                                    Text(
                                                        'population: ${data.data[index].population.toString()}'),
                                                    ListViewCurrencies(
                                                      data: data.data[index]
                                                          .currencies,
                                                    ),
                                                    ListViewLat(
                                                      data: data
                                                          .data[index].latlng,
                                                    ),
                                                    ListViewLanguages(
                                                        data: data.data[index]
                                                            .languages),
                                                    ListViewBorders(
                                                      data: data
                                                          .data[index].borders,
                                                    )
                                                  ]),
                                                ),
                                              ]))));
                            },
                          ),
                        ),
                      );
                    }));
          })
        ])));
  }
}
