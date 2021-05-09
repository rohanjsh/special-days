import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
            return Container(color: Colors.blue);
          }

          if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
            return Container(color: Colors.red);
          }

          if (sizingInformation.deviceScreenType == DeviceScreenType.watch) {
            return Container(color: Colors.yellow);
          }

          return Container(color: Colors.purple);
        },
      ),
    );
  }
}
