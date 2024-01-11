import 'package:get/state_manager.dart';

//Reactive State manager

class CounterController extends GetxController {
  RxInt count = 0.obs; // Observable variable
   

  void increment() {
    count++; // Updating the count
  }
  void decrement() {
    count--; // Updating the count
  }
}




//Simple State manager

// class CounterController extends GetxController {
//   var count = 0;

//   void increment() {
//     count++;
//     // Manually trigger UI update
//     update();
//   }
//   void decrement() {
//     count--;
//     // Manually trigger UI update
//     update();
//   }
// }