import 'package:flutter/material.dart';
import 'package:monkey_meal_project/src/models/offer_item_model.dart';
import 'package:monkey_meal_project/src/screens/home/views/offer_view/component/offer_card.dart';
class ListViewOffers extends StatelessWidget {
  final List<OfferItemModel> offerItemModels;
  const ListViewOffers({super.key,required this.offerItemModels});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: offerItemModels.length,
        itemBuilder: (context,index){
      return OfferCard(offerItemModel: offerItemModels[index]);
    });
  }
}
