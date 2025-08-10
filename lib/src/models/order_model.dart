class OrderModel {
  final String restaurantName;
  final double deliveryLocationLatitude;
  final double deliveryLocationLongitude;
  final DateTime orderDate;
  final double totalPrice;
  final String orderName;
  final String orderStatus;
  final String? specialInstructions;
  final String driverId;
  final double deliveryFee;
  final String? promoCodeApplied;
  final double discountAmount;
  final String paymentMethodType;
  final String paymentStatus;
final String imgUrl;
  // Constructor for the OfferModel class.
  OrderModel({

    required this.restaurantName,
    required this.deliveryLocationLatitude,
    required this.deliveryLocationLongitude,
    required this.orderDate,
    required this.totalPrice,
    required this.orderStatus,
    this.specialInstructions,
    required this.driverId,
    required this.deliveryFee,
    required this.imgUrl,
    required this.orderName,
    this.promoCodeApplied,

    required this.discountAmount,
    required this.paymentMethodType,
    required this.paymentStatus,
  });

  static List<OrderModel> orders = [
    // First OrderModel object
    OrderModel(
      restaurantName: "Burger Palace",
      orderName:'Burger' ,
      deliveryLocationLatitude: 34.0522,
      deliveryLocationLongitude: -118.2437,
      orderDate: DateTime(2023, 10, 27, 14, 30),
      totalPrice: 25.50,
      imgUrl:  'https://images.unsplash.com/photo-1578985545062-69928b1d9587',
      orderStatus: "Delivered",
      specialInstructions: null,
      driverId: "DRIVER-001",
      deliveryFee: 5.00,
      promoCodeApplied: "SAVE10",
      discountAmount: 2.55,
      paymentMethodType: "Credit Card",
      paymentStatus: "Paid",
    ),

    // Second OrderModel object
    OrderModel(
      restaurantName: "Pizza Heaven",
      orderName: 'Burger',
      deliveryLocationLatitude: 40.7128,
      deliveryLocationLongitude: -74.0060,
      orderDate: DateTime(2023, 10, 27, 19, 00),
      totalPrice: 42.75,
      imgUrl:  'https://images.unsplash.com/photo-1578985545062-69928b1d9587',
      orderStatus: "Preparing",
      specialInstructions: "Extra napkins, please.",
      driverId: "DRIVER-002",
      deliveryFee: 3.50,
      promoCodeApplied: null,
      discountAmount: 0.00,
      paymentMethodType: "Debit Card",
      paymentStatus: "Pending",
    ),
  ];
}