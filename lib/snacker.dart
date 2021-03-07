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
          RaisedButton(
            onPressed: () {
              Get.snackbar("标题", "消息提示",
                  colorText: Colors.white,
                  backgroundColor: Colors.black87,
                  duration: Duration(seconds: 3), //消息持续时间
                  snackPosition: SnackPosition.BOTTOM, //消息从底部弹出啊
                  titleText: Text(
                    "这是一个新标题",
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                  messageText: Column(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.ac_unit,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  icon: Icon(
                    Icons.usb,
                    size: 60,
                  ),
                  borderWidth: 2.0,
                  borderColor: Colors.white);
            },
            child: Text("SNAKBAR"),
          ),
          Container(
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
