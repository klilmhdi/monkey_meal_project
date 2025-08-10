import 'package:flutter/material.dart';
import 'package:monkey_meal_project/src/screens/home/views/main_view/component/resturant_section/resturant_card/resturant_data_text.dart';
import 'package:monkey_meal_project/src/screens/home/views/main_view/component/resturant_section/resturant_card/resturant_name.dart';
import 'package:monkey_meal_project/src/screens/home/views/main_view/component/resturant_section/resturant_card/resturant_rate_icon.dart';
import 'package:monkey_meal_project/src/screens/home/views/main_view/component/resturant_section/resturant_card/resturant_rate_text.dart';

class MostPopularCard extends StatelessWidget {
  const MostPopularCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MostPopularCardImage(),
          MostPopularCardData(),
        ],
      ),
    );
  }
}

class MostPopularCardData extends StatelessWidget {
  const MostPopularCardData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         const ResturantName(name: 'Café De Bambaa',),
          const SizedBox(height: 8),
          Row(
            children: [
             const ResturantDataText(text: 'Café • Western Food'),
              const ResturantRateIcon(),
              const SizedBox(width: 4),
              const ResturantRateText(rating: 4.9)
            ],
          ),
        ],
      ),
    );
  }
}

class MostPopularCardImage extends StatelessWidget {
  const MostPopularCardImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      width: 220,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
        image: DecorationImage(
          image: AssetImage('images/most_popular.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}