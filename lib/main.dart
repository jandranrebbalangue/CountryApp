import 'package:flutter/material.dart';
import 'package:flutter_app/services/countriesprovider.dart';
import 'package:provider/provider.dart';

import 'file:///C:/Users/Pandong/AndroidStudioProjects/flutter_app/lib/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => CountriesProvider(),
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: HomePage(),
          debugShowCheckedModeBanner: false,
        ));
  }
}
