class OfferItemModel {
  final String imageUrl;
  final String title;
  final double rating;
  final int ratingsCount;
  final String categories;
  OfferItemModel({required this.imageUrl,required this.title,
    required this.rating,required this.ratingsCount,required this.categories,}
      );
  static List<OfferItemModel> offerItems = [
    OfferItemModel(
      imageUrl: 'https://images.unsplash.com/photo-1578985545062-69928b1d9587',
      title: 'Café de Noires',
      rating: 4.9,
      ratingsCount: 124,
      categories: 'Cafe • Western Food',
    ),
    OfferItemModel(
      imageUrl: 'https://images.unsplash.com/photo-1578985545062-69928b1d9587',
      title: 'Isso',
      rating: 4.5,
      ratingsCount: 98,
      categories: 'Seafood • Fusion',
    ),
    OfferItemModel(
      imageUrl: 'https://images.unsplash.com/photo-1578985545062-69928b1d9587',
      title: 'Green Bowl',
      rating: 4.7,
      ratingsCount: 205,
      categories: 'Healthy • Vegan',
    ),
    OfferItemModel(
      imageUrl: 'https://images.unsplash.com/photo-1578985545062-69928b1d9587',
      title: 'Pizza Place',
      rating: 4.2,
      ratingsCount: 310,
      categories: 'Italian • Pizza',
    ),
    OfferItemModel(
      imageUrl: 'https://images.unsplash.com/photo-1578985545062-69928b1d9587',
      title: 'Sushi Time',
      rating: 4.8,
      ratingsCount: 150,
      categories: 'Japanese • Sushi',
    ),
  ];

}