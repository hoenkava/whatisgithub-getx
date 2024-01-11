import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provideraaaa/counter_controller.dart';

class MyAppGetBuilder extends StatelessWidget {
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Simple State Manager Getx'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder<CounterController>(
                builder: (controller) {
                  return Text(
                    'Count: ${controller.count}',
                    style: const TextStyle(fontSize: 24),
                  );
                },
              ),


// 1. `GetBuilder<CounterController>`: Yeh GetX ka widget hai jo `CounterController`
//  class ke sath juda hai. Yahan hum keh rahe hain ki jab bhi `CounterController` 
//  ke state mein koi badlav hota hai, tab yeh widget automatic taur par rebuild ho.

// 2. `builder: (controller) { ... }`: Yeh ek function hai jo UI ko build karta hai.
//  `controller` ek parameter hai jismein `CounterController` ka ek instance aata hai.
//   Isse hum access kar sakte hain `CounterController` ke state ko.

// 3. `Text('Count: ${controller.count}', style: const TextStyle(fontSize: 24))`:
//  Yahan ek `Text` widget hai jo counter ke value ko display karta hai.
//   `${controller.count}` se hum `CounterController` ke `count` variable ko 
//   access kar rahe hain, aur jab yeh variable badalta hai, tab yeh Text widget 
//   automatic taur par update hota hai.

// Is tareeke se, jab `CounterController` ke state mein koi badlav hota hai 
// (jaise ki count badhna), tab `GetBuilder` apne `builder` function ko call 
// karta hai, jo fir UI ko update karta hai. Yeh kaam automatic taur par hota hai,
//  aur humein manually UI ko update karne ki zarurat nahi hoti.

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.increment(); // Incrementing the count
                    },
                    child: const Text('Increment'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.decrement(); // Decrementing the count
                    },
                    child: const Text('Decrement'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}