import '../model/phone.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewModel extends StateNotifier<Phone> {
  HomeViewModel(state) : super(const Phone());

  void setQuantity(int quantity) {
    final newState = state.copy(quantity: quantity);
    state = newState;
  }

  void increasePrice() {
    final newState = state.copy(price: state.price + 50);
    state = newState;
  }

  void decreasePrice() {
    final newState = state.copy(price: state.price - 50);
    state = newState;
  }
}
