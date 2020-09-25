import 'package:get/get.dart';
import 'package:vanilla_bloc/models/testing.dart';

class CounterController extends GetxController {
  var count = Testing(
    name: "Testing",
    description: "Lorem Ipsum",
    count: 0
  ).obs;

  increment() {
    count.update((_count) {
      _count.count ++;
    });
  }

  decrement() {
    count.update((_count) {
      _count.count --;
    });
  }
}