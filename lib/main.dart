import 'package:flutter/material.dart';
import 'package:flutter_check_conection_internet_provider/connectivity_provider.dart';
import 'package:flutter_check_conection_internet_provider/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ConnectivityProvider(),
          child: HomePage(),
        ),
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
