import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});

class CounterPageApp extends ConsumerWidget {
  const CounterPageApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var value = ref.watch(counterStateProvider);
    return MaterialApp(
      title: "Riverpod demo",
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              "Value ${value.toString()}",
              style: const TextStyle(fontSize: 30),
            )),
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                  ref.read(counterStateProvider.notifier).state++;
                },
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  ref.read(counterStateProvider.notifier).state--;
                },
                child: const Icon(Icons.remove),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
