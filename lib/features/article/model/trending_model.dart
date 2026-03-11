class TrendingModel {
  final String title;
  final String image;
  final String category;
  final bool isTrending;

  TrendingModel ({
    required this.title,
    required this.image,
    required this.category,
    this.isTrending = false,
  });
}

final List<TrendingModel> trendingData = <TrendingModel>[
  TrendingModel(
    title: "Adding Salt to Your Food May Increase Risk of Premature Death",
    image: "https://images.unsplash.com/photo-1505576399279-565b52d4ac71",
    category: "Nutrition",
    isTrending: true,
  ),
  TrendingModel(
    title: "COVID-19 Reinfection May Increase the Risk of Health Problems",
    image: "https://images.unsplash.com/photo-1584036561566-baf8f5f1b144",
    category: "Health",
    isTrending: true,
  ),
  TrendingModel(
    title: "Healthy Eating: The Key to a Strong Body",
    image: "https://images.unsplash.com/photo-1490645935967-10de6ba17061",
    category: "Nutrition",
  ),
];