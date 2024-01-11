import 'package:flutter/material.dart';

class statefulDemo extends StatefulWidget {
  const statefulDemo({Key? key}) : super(key: key);

  @override
  State<statefulDemo> createState() => _statefulDemoState();
}

class _statefulDemoState extends State<statefulDemo> {
  bool isVisible = false;
  late ValueNotifier<int> number;

  @override
  void initState() {
    super.initState();
    number = ValueNotifier<int>(0);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  number.value++;
                },
                child: Text("Update values")),
            StatefulDemoWidget(
              number: number,
            ),
          ],
        )),
      ),
    );
  }
}

class StatefulDemoWidget extends StatefulWidget {
  const StatefulDemoWidget({Key? key, required this.number, this.isVisible = false}) : super(key: key);
  final bool? isVisible;
  final ValueNotifier<int> number;

  @override
  State<StatefulDemoWidget> createState() => _StatefulDemoWidgetState();
}

class _StatefulDemoWidgetState extends State<StatefulDemoWidget> {
  @override
  void initState() {
    super.initState();
    print("init");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    print("build");

    return Container(
      child: Column(
        children: [
          Text("data"),
          Center(
              child: ValueListenableBuilder<int>(
            valueListenable: widget.number,
            builder: (context, int value, _) {
              print("ValueListenableBuilder");
              return Text("counter : ${value}");
            },
          )),
        ],
      ),
    );
  }

  @override
  void dispose() {
    print("dispose");

    super.dispose();
  }

  @override
  void didUpdateWidget(StatefulDemoWidget oldWidget) {
    print("didUpdateWidget");
    if (widget.isVisible != oldWidget.isVisible) {}
    super.didUpdateWidget(oldWidget);
  }

  void refresh() {
    setState(() {
      if (mounted) {
        // some code executions
      }
      print("");
    });
  }
}