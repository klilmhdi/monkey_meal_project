import 'package:flutter/material.dart';
import 'package:monkey_meal_project/src/helper/helper.dart';
import 'package:monkey_meal_project/src/models/order_model.dart';
class OrderCard extends StatelessWidget {
  final OrderModel orderModel;
  const OrderCard({super.key, required this.orderModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Helper.getScreenHeight(context) * .2,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            // Burger image with rounded corners
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
orderModel.imgUrl,
                width: Helper.getScreenWidth(context)*0.2,
                height: Helper.getScreenWidth(context)*0.2,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16.0), // Spacing between image and text

            // Column for all the text content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Restaurant name
                   Text(
                    orderModel.orderName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),

                  // Rating section
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      const SizedBox(width: 4.0),
                      const Text(
                        '4.9',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        '(124 ratings)',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),

                  // Cuisine type
                  Text(
                    'Burger • Western Food',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 4.0),

                  // Location with pin icon
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.orange,
                        size: 16,
                      ),
                      const SizedBox(width: 4.0),
                      Expanded(
                        child: Text(
                          'No 03, 4th Lane, Newyork',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}