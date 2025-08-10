import 'package:flutter/material.dart';
import 'package:monkey_meal_project/core/shared_widgets/custom_search_app_bar.dart';
import 'package:monkey_meal_project/src/helper/helper.dart';
import 'package:monkey_meal_project/src/screens/change_address_screen/component/map_widget.dart';
class ChangeAddressScreen extends StatelessWidget {
  static String routeName = '/changeAddressRoute';

  const ChangeAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Checkout',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(child: MapWidget()),
SizedBox(height: 16,),
          CustomSearchBar(hintText: 'Search Address',),
          SizedBox(height: 8,)

        ]

      ),
    );
  }
}
