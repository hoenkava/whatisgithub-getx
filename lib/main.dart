import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provideraaaa/counter_provider.dart';
import 'package:provideraaaa/extra/lifecycle_stateful.dart';
import 'package:provideraaaa/home_page.dart';
import 'package:provideraaaa/myapp_getx_getbuilder.dart';
import 'package:provideraaaa/myapp_getx_obx.dart';

// Ab, yaha CounterNotifier class ka ek instance banate hain aur ise apne widget tree 
// mein integrate karte hain. Iske liye, ham ChangeNotifierProvider ka istemal karenge.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => CounterNotifier(), // CounterNotifier class ka instance create karenge yahaan
        child: StateFulWidgetLifecycle(),
      ),
      // Yahan ChangeNotifierProvider ek widget hai jo ek ChangeNotifier 
// class ke instance ko provide karta hai. Iske parameters mein:

// create:: Yeh ek function hai jo ek naya instance create karta hai.
//  Yahan CounterNotifier class ka ek naya instance banaya ja raha hai. 
//  CounterNotifier ek class hai jo ChangeNotifier ko extend karti hai, 
//  aur ismein hamara data aur state store hota hai.

// child:: Yeh woh widget hai jo is provider ke sath connect hokar iske 
// state ko use karega. Yahan MyHomePage widget diya gaya hai, jo is provider
//  ke sath connect hokar apne UI ko update karega jab bhi data mein koi change hoga.
    );
  }
}

