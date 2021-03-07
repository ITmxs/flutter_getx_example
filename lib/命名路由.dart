import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

void main() => runApp(GetMaterialApp(
    initialRoute: '/',
    defaultTransition: Transition.zoom,
    // unknownRoute: GetPage(name: '/notfound', page: () => UnknownRoutePage()),//要处理到未定义路线的导航（404错误）
    getPages: [
      GetPage(name: '/', page: () => Home()),
      GetPage(
        name: '/second',
        page: () => Second(),
        // transition: Transition.zoom,
      ),
      GetPage(name: '/login', page: () => Login()),
      // GetPage(
      //   name: '/third',
      //   page: () => Third(),
      //   transition: Transition.zoom
      // ),
    ],
    routingCallback: (routing) {
      //如果你想通过监听Get事件来触发动作，你可以使用routingCallback来实现。
      if (routing.current == '/second') {
        // openAds();
        print("555555555555");
      }
    }));

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
              onLongPress: () {
                Get.toNamed("/login");
              },
              child: Text("跳转到登陆界面"),
            ),
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
                child: Obx(
                  () => Text(
                    controller.count.toString(),
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              child: Text('Next Route'),
              onPressed: () {
                Get.toNamed(
                  '/second',
                  arguments: {
                    'name': 'luckly',
                    'age': '23',
                  },
                ); //进入下一个页面
                // Get.off(Second());//进入下一个页面，但没有返回上一个页面的选项（用于闪屏页，登录页面等）。
                // Get.offAll(Second());//进入下一个页面并取消之前的所有路由（在购物车、投票和测试中很有用）.清理堆栈
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
    final result = Get.arguments;
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Center(child: Text("${ctrl.count}" + Get.arguments["name"])));
  }
}

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);
  @override
  Widget build(context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("登录界面"),
        ),
      ),
    );
  }
}
