import 'package:equatable/equatable.dart';

class Phone extends Equatable {
  final int price;
  final int quantity;

  const Phone({this.price = 200, this.quantity = 1});

  Phone copy({
    int? price,
    int? quantity,
  }) =>
      Phone(
        price: price ?? this.price,
        quantity: quantity ?? this.quantity,
      );

  @override
  List<Object?> get props => [price, quantity];
}
