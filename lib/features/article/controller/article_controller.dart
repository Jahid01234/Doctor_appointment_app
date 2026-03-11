import 'package:doctor_appointment_app/features/article/model/article_model.dart';
import 'package:doctor_appointment_app/features/article/model/trending_model.dart';
import 'package:get/get.dart';

class ArticleController extends GetxController{
  RxList<TrendingModel> trendingList = <TrendingModel>[].obs;
  RxList<ArticleModel> allArticles = <ArticleModel>[].obs;
  RxList<ArticleModel> filteredArticles = <ArticleModel>[].obs;
  RxString selectedFilter = 'All'.obs;
  RxInt currentIndex = 0.obs;


  final List<String> filterTabs = [
    'All',
    'Covid-19',
    'Health',
    'LifeStyle',
    'Medical',
  ];


  @override
  void onInit() {
    super.onInit();
    loadTrending();
    loadArticles();
  }

  void changeIndex(int index) {
    currentIndex.value = index;
  }


  void loadTrending() {
    trendingList.value = trendingData;
  }

  void loadArticles() {
    allArticles.value = articlesData;
    applyFilter('All');
  }


  // Filter apply  ..............
  void applyFilter(String filter) {
    selectedFilter.value = filter;

    List<ArticleModel> result;
    if (filter == 'All') {
      result = List.from(allArticles);
    } else {
      result = allArticles
          .where((d) => d.tag.toLowerCase() == filter.toLowerCase())
          .toList();
    }
    filteredArticles.value = result;
  }

}