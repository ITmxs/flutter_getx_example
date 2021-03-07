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
              Get.defaultDialog(
                title: "标题",
                titleStyle: TextStyle(color: Colors.red),
                content: Column(
                  children: [
                    Text("这是模拟数据"),
                    Text("这是模拟数据"),
                    Text("这是模拟数据"),
                  ],
                ),
                // textCancel: "取消",
                // cancelTextColor: Colors.orange,
                // onCancel: () {
                //   Get.back(); //取消
                // },
                // textConfirm: "确定",
                // confirmTextColor: Colors.black87,
                // buttonColor: Colors.greenAccent,
                // onConfirm: () {},

                cancel: RaisedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("取消"),
                ),
                confirm: RaisedButton(
                  onPressed: () {
                    Get.back();
                    Get.snackbar("标题", "消息确认完毕");
                  },
                  child: Text(
                    "确定",
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                ),
                backgroundColor: Colors.black.withOpacity(0.8),
                barrierDismissible: false, //默认点击取消

                radius: 10.0,
              );
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
