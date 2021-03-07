import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

void main() => runApp(GetMaterialApp(home: Home()));

class Home extends StatelessWidget {
  final controller = Get.put(Controller());

  @override
  Widget build(context) => Scaffold(
      appBar: AppBar(title: Text("counter")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Get.to(Second());
            },
            child: Container(
              height: 200,
              width: 200,
              color: Colors.red,
              child: Center(
                child: Obx(() => Text(
                      controller.count.toString(),
                      style: TextStyle(fontSize: 50, color: Colors.blueAccent),
                    )),
              ),
            ),
          ),
          ElevatedButton(
            child: Text('Next Route'),
            onPressed: () {
              Get.to(Second());
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => controller.increment(),
      ));
}

class Second extends StatelessWidget {
  final Controller ctrl = Get.find();
  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Center(child: Text("${ctrl.count}")));
  }
}
