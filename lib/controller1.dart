import 'dart:html';

import 'package:get/get.dart';
//依赖注入的思想
//DisposableInterface  释放，可以理解为生命周期
class Controller extends GetxController {
  // final count1 = 0.obs;
  // final count2 = 0.obs;
  // int get sum => count1.value + count2.value;
  final count1 = 0.obs;
  final count2 = 0.obs;
  int get sum => count1.value + count2.value;

  @override
//控制器初始化
  void onInit() {
    super.onInit();

    ever(count1, (callback) {
      //计算购物车价格 count  购买数量

      print(callback);
    });
    once(count1, (callback) {
      //用户登录信息，user =null

      //////只有在变量$_第一次被改变时才会被调用。

      print(callback.toString() + 'first');
    });

    ///防DDos - 每当用户停止输入1秒时调用，例如。 搜索场景，电脑
    debounce(count1, (_) => print("debouce$_"), time: Duration(seconds: 1));

    ///忽略1秒内的所有变化。
    interval(count1, (_) => print("interval $_"), time: Duration(seconds: 1));
  }
}
