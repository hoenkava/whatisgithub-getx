

import 'package:flutter/material.dart';

class StateFulWidgetLifecycle extends StatefulWidget {
   StateFulWidgetLifecycle({Key? key}) : super(key: key){
    print('constructor called');
  }
  @override
  //HERE createState() creates the state of the app
  //It also returns the instance of the associated state class
  _StateFulWidgetLifecycleState createState() {
    print('createState called');
    return _StateFulWidgetLifecycleState();
  }
}

class _StateFulWidgetLifecycleState extends State<StateFulWidgetLifecycle> {
  int durationInSeconds = 10;
  late int abc;


  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    print('initState called');
    abc = 3;
  }

  @override
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //app in background
    WidgetsBinding.instance.addObserver(
      LifecycleEventHandler(
        inactiveCallBack: () {
          print('app in background');
        },
        resumeCallBack: () {
          print('app in foreground');
        },
      ),
    );
    print('didChangeDependencies called');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate called');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose called');
    // Dispose of resources when the widget is permanently removed
   
  }

  @override
  Widget build(BuildContext context) {
    print('build called');
    return Scaffold(
      appBar: AppBar(
        title: Text(abc.toString()),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: AnimatedBox(durationInSeconds: durationInSeconds),
            ),
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (durationInSeconds == 10) {
              durationInSeconds = 2; // faster
            } else {
              durationInSeconds = 10; // slower
            }
          });
        },
      ),
    );
  }
}

class AnimatedBox extends StatefulWidget {
  final int durationInSeconds;

  const AnimatedBox({required this.durationInSeconds});

  @override
  _AnimatedBoxState createState() => _AnimatedBoxState();
}

class _AnimatedBoxState extends State<AnimatedBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(seconds: widget.durationInSeconds), vsync: this);
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    print('dispose called');
    // Dispose of resources when the widget is permanently removed
  }

  @override
  void didUpdateWidget(covariant AnimatedBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.durationInSeconds != widget.durationInSeconds) {
      _controller.duration = Duration(seconds: widget.durationInSeconds);
      _controller.repeat(reverse: true);
      print('current animation duration = ${_controller.duration}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext _, child) {
            return Transform.scale(
              scale: _controller.value,
              child: child,
            );
          },
          child: Container(
            width: 100,
            height: 50,
            color: Colors.deepOrange,
          ),
        ),
      ),
    );
  }
}

// LifecycleEventHandler class

class LifecycleEventHandler extends WidgetsBindingObserver {
  final Function? resumeCallBack;
  final Function? suspendingCallBack;
  final Function? detachedCallBack;
  final Function? inactiveCallBack;

  LifecycleEventHandler({
    this.resumeCallBack,
    this.suspendingCallBack,
    this.detachedCallBack,
    this.inactiveCallBack,
  });

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        resumeCallBack!();
        break;
      case AppLifecycleState.inactive:
        inactiveCallBack!();
        break;
      case AppLifecycleState.paused:
        //suspendingCallBack!();
        break;
      case AppLifecycleState.detached:
        detachedCallBack!();
        break;

      default:
        break;
    }
  }
}
