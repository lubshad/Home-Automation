import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_mcu/services/databaseService.dart';

import 'controllers/switchController.dart';

void main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Automation"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: GetX<SwitchController>(
          init: Get.put(SwitchController()),
          builder: (switchController) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Status : ${switchController.swithcStatus}"),
                SizedBox(
                  height: 20,
                ),
                CupertinoSwitch(
                  value: switchController.switchValue == "ON" ? true : false,
                  onChanged: (value) {
                    DatabaseService().changeLEDstatus(value);
                  },
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Value : ${Get.find<SwitchController>().switchValue}");
          print("Status : ${Get.find<SwitchController>().swithcStatus}");
        },
      ),
    );
  }
}
