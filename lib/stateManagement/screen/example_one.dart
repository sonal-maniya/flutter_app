import 'package:flutter/material.dart';
import 'package:flutter_app/stateManagement/provider/example_one_provider.dart';
import 'package:provider/provider.dart';

class ExampleOneWidget extends StatefulWidget {
  const ExampleOneWidget({super.key});

  @override
  State<ExampleOneWidget> createState() => _ExampleOneWidgetState();
}

class _ExampleOneWidgetState extends State<ExampleOneWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExampleOneProvider>(context, listen: false);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleOneProvider>(builder: (context, value, child) {
            return Slider(
                min: 0,
                max: 1,
                value: provider.sliderValue,
                onChanged: (value) {
                  provider.setSliderValue(value);
                });
          }),
          Consumer<ExampleOneProvider>(builder: (context, value, child) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color:
                          Colors.amberAccent.withOpacity(provider.sliderValue),
                    ),
                    child: const Center(child: Text("Container 2")),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.redAccent.withOpacity(provider.sliderValue),
                    ),
                    child: const Center(child: Text("Container 2")),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
