import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:monkey_meal_project/core/consts/functions/animations.dart';
import 'package:monkey_meal_project/src/manage/foods_model/foods_cubit.dart';
import 'package:monkey_meal_project/src/models/item_model.dart';

import '../../../core/helper/firebase_helper.dart';
import '../../models/order_model.dart';

class FoodListScreen extends StatelessWidget {
  const FoodListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Items'),
        actions: [
          IconButton(
            onPressed: () => NavAndAnimationsFunctions.navTo(context, OrdersScreen()),
            icon: Icon(Icons.shopping_bag),
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => FoodsCubit()..fetchFoods(),
        child: BlocBuilder<FoodsCubit, FoodsState>(
          builder: (context, state) {
            if (state is LoadFoodLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FailedLoadFood) {
              return Center(child: Text('Error: ${state.message}'));
            } else if (state is SuccessLoadFood) {
              return _buildFoodList(state.foods);
            }
            return const Center(child: Text('No data available'));
          },
        ),
      ),
    );
  }

  Widget _buildFoodList(List<ItemModel> foods) {
    return ListView.builder(
      itemCount: foods.length,
      itemBuilder: (context, index) {
        final food = foods[index];
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: SizedBox(
              width: 60,
              height: 60,
              child: CachedNetworkImage(
                imageUrl: food.itemCover,
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
            title: Text(food.itemName),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  food.itemDescription.length > 100
                      ? '${food.itemDescription.substring(0, 100)}...'
                      : food.itemDescription,
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    Text(' ${food.itemRating.toStringAsFixed(1)}'),
                    SizedBox(width: 16),
                    Text('\$${food.itemPrice}'),
                  ],
                ),
              ],
            ),
            onTap: () => NavAndAnimationsFunctions.navToWithRTLAnimation(context, FoodDetailScreen(food: food)),
          ),
        );
      },
    );
  }
}

class FoodDetailScreen extends StatefulWidget {
  final ItemModel food;

  const FoodDetailScreen({super.key, required this.food});

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  int _quantity = 1;
  bool _isFavorite = false;
  late FoodsCubit _foodsCubit;
  late String? _userId;

  @override
  void initState() {
    super.initState();
    _foodsCubit = FoodsCubit.get(context);
    _userId = FirebaseServices().currentUserId;
    _checkFavoriteStatus();
  }

  Future<void> _checkFavoriteStatus() async {
    if (_userId == null) return;

    try {
      final isFav = await FirebaseServices().isFavorite(_userId!, widget.food.itemName);
      setState(() {
        _isFavorite = isFav;
      });
    } catch (e) {
      debugPrint("Error checking favorite status: $e");
    }
  }

  Future<void> _toggleFavorite() async {
    if (_userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please sign in to add favorites')));
      return;
    }

    try {
      setState(() {
        _isFavorite = !_isFavorite;
      });
      await _foodsCubit.toggleFavorite(_userId!, widget.food);
    } catch (e) {
      setState(() {
        _isFavorite = !_isFavorite; // Revert on error
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: ${e.toString()}')));
    }
  }

  Future<void> _addToOrder() async {
    if (_userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please sign in to place orders')));
      return;
    }

    try {
      await _foodsCubit.addItemToOrder(_userId!, widget.food, _quantity);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Added $_quantity ${widget.food.itemName} to order'),
          action: SnackBarAction(
            label: 'View Orders',
            onPressed: () {
              NavAndAnimationsFunctions.navTo(context, OrdersScreen());
            },
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: ${e.toString()}')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final food = widget.food;

    return Scaffold(
      appBar: AppBar(
        title: Text(food.itemName),
        actions: [
          IconButton(
            icon: Icon(_isFavorite ? Icons.favorite : Icons.favorite_border, color: Colors.red),
            onPressed: _toggleFavorite,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: food.itemCover,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error, size: 50),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(food.itemName, style: Theme.of(context).textTheme.headlineMedium),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  Text(" ${food.itemRating.toStringAsFixed(1)}", style: const TextStyle(fontSize: 16)),
                  const SizedBox(width: 20),
                  Text("\$${food.itemPrice}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(food.itemDescription, style: const TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 20),
            _buildOrderSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderSection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(border: Border(top: BorderSide(color: Colors.grey, width: 0.3))),
      child: Row(
        children: [
          // Counter buttons
          IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: () {
              if (_quantity > 1) {
                setState(() {
                  _quantity--;
                });
              }
            },
          ),
          Text(_quantity.toString(), style: const TextStyle(fontSize: 18)),
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () {
              setState(() {
                _quantity++;
              });
            },
          ),
          const Spacer(),
          ElevatedButton.icon(
            icon: const Icon(Icons.shopping_cart),
            label: const Text("Order Now"),
            onPressed: _addToOrder,
          ),
        ],
      ),
    );
  }
}

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodsCubit()..fetchUserOrders(FirebaseServices().currentUserId!),
      child: Scaffold(
        appBar: AppBar(title: const Text('My Orders')),
        body: BlocBuilder<FoodsCubit, FoodsState>(
          builder: (context, state) {
            if (state is OrdersLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is OrdersError) {
              return Center(child: Text(state.message));
            } else if (state is OrdersLoaded) {
              return _buildOrdersList(context, state.orders);
            }
            return const Center(child: Text('No orders found'));
          },
        ),
      ),
    );
  }

  Widget _buildOrdersList(BuildContext context, List<OrderModel> orders) {
    if (orders.isEmpty) {
      return const Center(child: Text('You have no orders yet'));
    }

    final deliveryCost = 16.0;
    final subtotal = orders.fold(0.0, (sum, order) => sum + order.totalPrice);
    final total = subtotal + deliveryCost;

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return _buildOrderItem(context, order);
            },
          ),
        ),
        _buildOrderSummary(subtotal, deliveryCost, total),
      ],
    );
  }

  Widget _buildOrderItem(BuildContext context, OrderModel order) {
    final dateFormat = DateFormat('MMM dd, yyyy - hh:mm a');
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: order.itemCover,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.fastfood),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(order.itemName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 4),
                      Text('Quantity: ${order.quantity}', style: TextStyle(color: Colors.grey[600])),
                      Text('\$${order.itemPrice} each', style: TextStyle(color: Colors.grey[600])),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$${order.totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: _getStatusColor(order.status),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        order.status.toUpperCase(),
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Ordered on: ${dateFormat.format(order.orderedAt)}',
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
            if (order.status == 'pending')
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    FoodsCubit.get(context).updateOrderStatus(FirebaseServices().currentUserId!, order.id, 'cancelled');
                  },
                  child: const Text('Cancel Order', style: TextStyle(color: Colors.red)),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderSummary(double subtotal, double deliveryCost, double total) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: const Border(top: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      child: Column(
        children: [
          _buildSummaryRow('Subtotal', subtotal),
          _buildSummaryRow('Delivery Fee', deliveryCost),
          const Divider(height: 20),
          _buildSummaryRow('Total', total, isTotal: true),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, double value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: isTotal ? 16 : 14, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal),
          ),
          Text(
            '\$${value.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: isTotal ? 18 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? Colors.green : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'delivered':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      case 'shipped':
        return Colors.blue;
      default: // pending
        return Colors.orange;
    }
  }
}
