import 'package:flutter/foundation.dart';



// Ab, ek CounterNotifier class create karte hai jo hamare data ko manage karega. 
// Is class mein hum counter ko store karenge aur use badhane-gatthane ka kaam karenge.

class CounterNotifier extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners(); // Ye method batata hai ki data badal gaya hai
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }
}
