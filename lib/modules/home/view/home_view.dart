import 'package:flutter/material.dart';
import '../model/phone.dart';
import '../view_model/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeViewModel = StateNotifierProvider<HomeViewModel, Phone>(
    (ref) => HomeViewModel(const Phone()));

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phone = ref.watch(homeViewModel);

    return Scaffold(
      appBar: AppBar(title: const Text('MVVM & Riverpod')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${phone.price}'),
          Text('${phone.quantity}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () =>
                      ref.read(homeViewModel.notifier).decreasePrice(),
                  child: const Text('-')),
              TextButton(
                  onPressed: () =>
                      ref.read(homeViewModel.notifier).increasePrice(),
                  child: const Text('+')),
            ],
          ),
          Slider(
            value: phone.quantity.toDouble(),
            onChanged: (newValue) {
              ref.read(homeViewModel.notifier).setQuantity(newValue.toInt());
            },
            min: 1,
            max: 2,
            divisions: 1,
          ),
        ],
      ),
    );
  }
}
