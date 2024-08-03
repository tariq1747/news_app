import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/models/models.dart';
import 'package:news_app/repositories/repositories.dart';
import 'package:news_app/res/res.dart';
import 'package:news_app/utils/enums.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  HomeController(this._repository);

  final HomeRepository _repository;

  late TabController tabController;

  final _refreshControllers = <NewsCategorys, RefreshController>{};

  RefreshController get refreshController => _refreshControllers[categoryType]!;

  final RxList<NewsModel> _newsList = <NewsModel>[].obs;
  List<NewsModel> get newsList => _newsList;
  set newsList(List<NewsModel> value) => _newsList.value = value;

  final Rx<NewsCategorys> _categoryType = NewsCategorys.general.obs;
  NewsCategorys get categoryType => _categoryType.value;
  set categoryType(NewsCategorys value) => _categoryType.value = value;

  final textcontroller = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(
      vsync: this,
      length: NewsCategorys.values.length,
    );
    generateVariables();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchNews();
    });
  }

  void generateVariables() {
    for (var type in NewsCategorys.values) {
      _refreshControllers[type] = RefreshController();
    }
  }

  Future<void> fetchNews({
    NewsCategorys? category,
    int page = 0,
    int pageSize = 10,
    String country = 'us',
    String? q,
  }) async {
    var paramObject = NewsParameters(
      apiKey: AppConstants.apikey,
      category: category?.label,
      country: country,
      page: page,
      pageSize: pageSize,
      q: q,
    );

    var newsListRes = await _repository.fetchNews(paramObject);

    if (page == 0) {
      newsList = newsListRes;
    } else {
      newsList.addAll(newsListRes);
    }
    _refreshControllers[category]!.refreshCompleted();
    _refreshControllers[category]!.loadComplete();
  }
}
