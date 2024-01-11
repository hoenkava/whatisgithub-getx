import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provideraaaa/counter_provider.dart';

// Ab, hum Consumer widget ka istemal karenge apne UI ko update karne ke liye.

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Counter Value:',
            ),
            // Consumer widget ka istemal karke counter value ko update karenge
            Consumer<CounterNotifier>(
              // This builder function will be called whenever CounterNotifier is changed
              builder: (context, counter, child) {
                return Text(
                  '${counter.counter}', // Counter value yahaan update hoga
                  style: const TextStyle(fontSize: 24),
                );
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Counter increment karne ka button
                    Provider.of<CounterNotifier>(context, listen: false)
                        .increment();


 // Yahan Provider.of ek method hai jo CounterNotifier ke instance ko retrieve 
// karta hai. Iske parameters mein:

// <CounterNotifier>: Yeh bataata hai ki aap kis type ka data retrieve karna 
// chahte hain. Yahan CounterNotifier class ka instance retrieve ho raha hai.

// context: Yeh parameter widget tree ke context ko represent karta hai, jisse 
// Provider pata chal sake ki data kahan se retrieve karna hai.

// listen: false: Yeh ek optional parameter hai. Yadi listen ko false set kiya jaye, 
// to Provider data mein koi change ho tab bhi widget ko update nahi karega. Yahan, 
// sirf data ko retrieve karke use kar rahe hain, isliye listen ko false set kiya gaya hai.

// .increment(): Jab Provider.of se CounterNotifier ka instance milta hai, 
// uske baad increment method ko call kiya jata hai. Yeh CounterNotifier class 
// ke ek method hai jo count ko badhata hai ya increment karta hai.

// Is code ka overall kaam hai CounterNotifier ke instance ko retrieve karna aur 
// uske increment method ko call karna, jisse counter ki value badhe.                       
                  },
                  child: const Text('Increment'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Counter decrement karne ka button
                    Provider.of<CounterNotifier>(context, listen: false)
                        .decrement();
                  },
                  child: const Text('Decrement'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}








