import 'package:flutter/material.dart';
import 'package:flutter_9_10/controller/counter_controller.dart';
import 'package:get/get.dart';

class SecondPage extends StatelessWidget {
  SecondPage({super.key});

  final controller = Get.find<CounterController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CounterController>(
      init: controller,
      builder: (couter) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Second Page'),
          ),
          body: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to the Second Page!',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 16),
                Text(
                  couter.count.value.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(fontSizeDelta: 18),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Text(
                    'back home page.',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async => couter.decrement(),
            child: const Icon(Icons.remove),
          ),
        );
      }
    );
  }
}
