import 'package:flutter/material.dart';
import 'package:flutter_9_10/controller/counter_controller.dart';
import 'package:flutter_9_10/second_page.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CounterController>(
      init: controller,
      builder: (counter) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home Page'),
          ),
          body: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to the Home Page!',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 16),
                Text(
                  counter.count.value.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(fontSizeDelta: 18),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: ()=> Get.to(SecondPage()),
                  child: Text(
                    'Watch next page.',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async => counter.increment(),
            child: const Icon(Icons.add),
          ),
        );
      }
    );
  }
}
