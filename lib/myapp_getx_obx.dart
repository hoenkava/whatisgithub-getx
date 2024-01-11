import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provideraaaa/counter_controller.dart';

class MyAppGetXObx extends StatelessWidget {

  //Dependency Registration
  //GetX Get.put ka istemaal dependencies register karne ke liye karta hai.
  //Yahan, hum CounterController class ka ek instance banate hain aur ise Get.put 
  //ke sath register karte hain.
  final CounterController controller = Get.put(CounterController());


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Reactive State Manager Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() {
                return Text(
                  'Count: ${controller.count}',
                  style: TextStyle(fontSize: 24),
                );
              }),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.increment(); // Incrementing the count
                    },
                    child: Text('Increment'),
                  ),

                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.decrement(); // Incrementing the count
                    },
                    child: Text('Deccrement'),
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