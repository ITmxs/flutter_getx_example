import 'package:get/get.dart';

class Controller extends GetxController {
  var count1 = 0;
  var count2 = 0.obs; //全局，多次使用，可以使用这个
  int get sum => count1 + count2.value;
  static Controller get to => Get.find(); // 添加这一行

  void increment() {
    count1++;
    update(['text1']); // 当调用增量时，使用update()来更新用户界面上的计数器变量。
  }
}
