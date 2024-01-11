//Dependency injection (DI) in GetX

// class MyController extends GetxController {
//   final ApiService apiService;

//   MyController(this.apiService);
// }

// GetX mein aap aksar controllers ka istemaal karte hain ek specific hisse 
// ya functionality ke state aur business logic ko manage karne ke liye. 
// Controllers GetxController ko extend karte hain. In controllers mein 
// dependencies injection ke liye constructor ke madhyam se dependencies 
// provide kiye ja sakte hain.

// Yahan, ApiService MyController ke liye ek dependency hai, aur ye constructor ke 
// madhyam se inject ki gayi hai.

// Ab jab bhi MyController ka instance banaya jayega, GetX apne aap ApiService ka 
// ek instance provide karega dependency injection ke through.