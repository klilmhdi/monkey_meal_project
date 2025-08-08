import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:monkey_meal_project/src/models/offer_item_model.dart';
class OfferCard extends StatelessWidget {
 final  OfferItemModel offerItemModel;

  const OfferCard({
    Key? key,
    required this.offerItemModel
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: CachedNetworkImage(
             imageUrl:  offerItemModel.imageUrl,
              width: double.infinity,
              height: MediaQuery.of(context).size.height*.1,
              //fit: BoxFit.cover,
              progressIndicatorBuilder:
                  (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => Icon(Icons.error),            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                offerItemModel. title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '${offerItemModel.rating} (${offerItemModel.ratingsCount} ratings)',
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const Text(' • ', style: TextStyle(color: Colors.grey)),
                    Text(
                    '${offerItemModel.categories}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}