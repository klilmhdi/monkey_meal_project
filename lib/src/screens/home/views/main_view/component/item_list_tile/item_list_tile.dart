import 'package:flutter/material.dart';
import 'package:monkey_meal_project/src/screens/home/views/main_view/component/resturant_section/resturant_card/resturant_data_text.dart';
import 'package:monkey_meal_project/src/screens/home/views/main_view/component/resturant_section/resturant_card/resturant_name.dart';
import 'package:monkey_meal_project/src/screens/home/views/main_view/component/resturant_section/resturant_card/resturant_rate_icon.dart';
import 'package:monkey_meal_project/src/screens/home/views/main_view/component/resturant_section/resturant_card/resturant_rate_text.dart';


// under work (not finished)
class ItemListTile extends StatelessWidget {
  const ItemListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 
      32.0,vertical: 16.0),
      child: ListTile(
        leading: Container(
          width: 75,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage('images/burger_image.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title:ResturantName(name: 'Mulberry Pizza by Josh'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            Text('Café • Western Food'),
            SizedBox(height: 4),
            Row(
              children: [
                ResturantRateIcon(),
                SizedBox(width: 4),
                ResturantRateText(rating: 4.9),
                SizedBox(width: 4),
                ResturantDataText(text: "(124 Ratings)",)
              ],
            ),
          ],
        ),
        contentPadding: EdgeInsets.all(16),
      ),
    );
  }
}