import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'coneroller2.dart';

void main() {
  final controller = Get.lazyPut(() => Controller());
  final controller2 = Get.put(Controller(), tag: '0001');
  runApp(
    GetMaterialApp(
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
      },
    ),
  );
}

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);
  @override
  Widget build(context) {
    // final controller = Get.put(Controller()); //依赖注入
    //实例化时。
    final user = User(name: "luckly", age: 18).obs;

    return Scaffold(
        appBar: AppBar(title: Text("counter")),
        body: Center(
          heightFactor: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // GetBuilder<Controller>(
              //   id: 'text1',
              //   init: Controller(), // 首次启动,初始化，省略也可以，在这儿还可以进行一些相关操作，高性能。主动-----
              //   builder: (_) => Text(
              //     '${_.count1}',
              //   ),
              // ),
              // GetBuilder<Controller>(
              //   init: Controller(), // 首次启动,初始化，省略也可以，在这儿还可以进行一些相关操作，高性能。主动-----
              //   builder: (_) => Text(
              //     '${_.count1}',
              //   ),
              // ),
              // GetBuilder<Controller>(
              //   init: Controller(), // 首次启动,初始化，省略也可以，在这儿还可以进行一些相关操作，高性能。主动-----
              //   builder: (_) => Text(
              //     '${_.count1}',
              //   ),
              // ),
              GetX<Controller>(
                //被动。基于流，局限于使用，局部使用
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
                  Controller.to.increment();
                },
                child: Text('count1'),
              ),
              ElevatedButton(
                onPressed: () {
                  Controller.to.count2.value++;
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
              ElevatedButton(
                onPressed: () {
                  Get.to(NewPage());
                },
                child: Text('NEWpage'),
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

class NewPage extends StatelessWidget {
  NewPage({Key key}) : super(key: key);
  final controller = Get.find<Controller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("新页面"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  controller.count2.toString(),
                  style: TextStyle(color: Colors.red, fontSize: 99),
                ))
          ],
        ),
      ),
    );
  }
}
