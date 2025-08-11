import 'package:equatable/equatable.dart';

class RestaurantModel extends Equatable {
  final String itemName;
  final String itemDescription;
  final String itemCover;
  final double itemRating;
  final int itemPrice;

  const RestaurantModel({
    required this.itemName,
    required this.itemDescription,
    required this.itemCover,
    required this.itemRating,
    required this.itemPrice,
  });

  RestaurantModel copyWith({
    String? itemName,
    String? itemDescription,
    String? itemCover,
    double? itemRating,
    int? itemPrice,
  }) {
    return RestaurantModel(
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
final List<RestaurantModel> restaurantList = [
  RestaurantModel(
    itemName: "Burger King",
    itemDescription: "Famous for flame-grilled burgers and fries.",
    itemCover: "assets/images/resturnat_imge.jpg",
    itemRating: 4.5,
    itemPrice: 12,
  ),
  RestaurantModel(
    itemName: "Pizza Palace",
    itemDescription: "Delicious wood-fired pizzas with fresh toppings.",
    itemCover: "assets/images/resturnat_imge.jpg",
    itemRating: 4.7,
    itemPrice: 15,
  ),
  RestaurantModel(
    itemName: "Sushi Master",
    itemDescription: "Premium sushi and sashimi in an elegant setting.",
    itemCover: "assets/images/resturnat_imge.jpg",
    itemRating: 4.8,
    itemPrice: 20,
  ),
  RestaurantModel(
    itemName: "Taco Haven",
    itemDescription: "Authentic Mexican street food with bold flavors.",
    itemCover: "assets/images/resturnat_imge.jpg",
    itemRating: 4.4,
    itemPrice: 10,
  ),
  RestaurantModel(
    itemName: "Pasta Corner",
    itemDescription: "Homemade Italian pasta and sauces.",
    itemCover: "assets/images/resturnat_imge.jpg",
    itemRating: 4.6,
    itemPrice: 14,
  ),
];