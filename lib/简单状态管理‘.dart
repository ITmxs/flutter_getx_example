import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_getx/%E8%B7%AF%E7%94%B1.dart';
import 'package:get/get.dart';

import 'controller1.dart';

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

      }
    }));

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);
  @override
  Widget build(context) {
    final controller = Get.put(Controller()); //依赖注入
    //实例化时。
    final user = User(name: "luckly", age: 18).obs;

    return Scaffold(
        appBar: AppBar(title: Text("counter")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetX<Controller>(
                builder: (controller) {
                  print("count 1 rebuild");
                  return Text('${controller.count1.value}');
                },
              ),
              GetX<Controller>(
                builder: (controller) {
                  print("count 2 rebuild");
                  return Text('${controller.count2.value}');
                },
              ),
              GetX<Controller>(
                builder: (controller) {
                  print("count 3 rebuild");
                  return Text('${controller.sum}');
                },
              ),
              ElevatedButton(
                onPressed: () {
                  controller.count1.value++;
                },
                child: Text('count1'),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.count1.value++;
                },
                child: Text('count2'),
              ),
              Obx(
                () => Text("name is ${user.value.name}"),
              ),
              Obx(
                () => Text("age is ${user.value.age.toString()}"),
              ),
              ElevatedButton(
                onPressed: () {
                  user.update((user) => {user.name = '001', user.age = 25});
                },
                child: Text('upadta user'),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => null,
        ));
  }
}

class User {
  User({String name, int age});
  var name;
  var age;
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
        body: Center(child: Text("0000000000")));
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
