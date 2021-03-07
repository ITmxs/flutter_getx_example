import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

void main() => runApp(GetMaterialApp(home: Home()));

class Home extends StatelessWidget {
  final controller = Get.put(Controller());

  @override
  Widget build(context) => Scaffold(
      appBar: AppBar(title: Text("counter")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    height: 300,
                    color: Colors.orange,
                    child: ListView(
                      children: [
                        ListTile(
                          //点击灯泡可以包裹
                          leading: Icon(
                            Icons.usb,
                            size: 60,
                            color: Colors.orange,
                          ), //点击Icons进去选择自己想要的图片
                          title: Text("重启"),
                        ),
                        ListTile(
                          trailing: Icon(Icons.usb),
                          title: Text("注销"),
                        ),
                        ListTile(
                          title: Text("开机"),
                        ),
                      ],
                    ),
                  ),

                  // enableDrag: false, //可拖动
                  // isDismissible: false,
                );
              },
              child: Text("bottomSheet"),
            ),
            RaisedButton(
              onPressed: () {
                Get.defaultDialog();
              },
              child: Text("dialog"),
            ),
            RaisedButton(
              onPressed: () {
                Get.snackbar("标题", "消息提示");
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
