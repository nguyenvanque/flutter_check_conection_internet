import 'package:flutter/material.dart';
import 'package:flutter_check_conection_internet_provider/no_internet.dart';
import 'package:provider/provider.dart';

import 'connectivity_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ConnectivityProvider>(context, listen: false).startMonitoring();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Internet Connectivity"),
        backgroundColor: Colors.redAccent,
      ),
      body: pageUI(),
    );
  }

  Widget pageUI() {
    return Consumer<ConnectivityProvider>(
      builder: (consumerContext, model, child) {
        if (model.isOnline != null) {
          return model.isOnline
              ? const Center(
                  child: Text(
                    "Home Page",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                )
              : NoInternet();
        }
        return  const Center(
          child:  CircularProgressIndicator(),
        );
      },
    );
  }
}
