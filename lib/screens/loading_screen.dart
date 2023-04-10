import 'package:flutter/material.dart';
import 'package:clima_flutter_new/services/location.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    Location location = Location();
    var lc = location.getCurrentLocation();
    lc.then(((value) {
      print(value.latitude);
      print(value.longitude);
    }));
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
