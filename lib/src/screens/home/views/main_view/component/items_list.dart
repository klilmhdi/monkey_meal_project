import 'package:flutter/material.dart';
import 'package:monkey_meal_project/src/screens/home/views/main_view/component/item_list_tile/item_list_tile.dart';

class ItemsList extends StatelessWidget {
  const ItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ItemListTile();
        },
      ),
    );
  }
}