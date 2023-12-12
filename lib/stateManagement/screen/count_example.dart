import 'package:flutter/material.dart';
import 'package:flutter_app/stateManagement/provider/count_provider.dart';
import 'package:provider/provider.dart';

class CountWidget extends StatefulWidget {
  const CountWidget({super.key});

  @override
  State<CountWidget> createState() => _CountWidgetState();
}

class _CountWidgetState extends State<CountWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    print("build all");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Subscribe"),
      ),
      body: Center(
        child: Consumer<CountProvider>(builder: (context, value, child) {
          print("build only  text");
          return Text(
            value.count.toString(),
            style: const TextStyle(fontSize: 50),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          countProvider.setCounter(),
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
