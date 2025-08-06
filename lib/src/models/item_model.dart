import 'package:equatable/equatable.dart';

class ItemModel extends Equatable {
  final String itemName;
  final String itemDescription;
  final String itemCover;
  final double itemRating;
  final int itemPrice;

  const ItemModel({
    required this.itemName,
    required this.itemDescription,
    required this.itemCover,
    required this.itemRating,
    required this.itemPrice,
  });

  ItemModel copyWith({
    String? itemName,
    String? itemDescription,
    String? itemCover,
    double? itemRating,
    int? itemPrice,
  }) {
    return ItemModel(
      itemName: itemName ?? this.itemName,
      itemDescription: itemDescription ?? this.itemDescription,
      itemCover: itemCover ?? this.itemCover,
      itemRating: itemRating ?? this.itemRating,
      itemPrice: itemPrice ?? this.itemPrice,
    );
  }

  @override
  List<Object?> get props => [itemName, itemCover, itemDescription, itemPrice, itemRating];
}
