import 'dart:convert';

import 'package:get/get.dart';
import 'package:news_app/data/data.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/models/news_parameters.dart';
import 'package:news_app/utils/utils.dart';

class HomeRepository {
  var apiWrapper = Get.find<ApiWrapper>();

  Future<List<NewsModel>> fetchNews(NewsParameters parameters) async {
    try {
      var res = await apiWrapper.makeRequest(
        '${Apis.news}?${parameters.toMap().makeQuery()}',
        type: RequestType.get,
        headers: Utility.header(),
        showLoader: true,
        showDialog: true,
      );

      if (res.hasError) {
        return [];
      }
      var data = jsonDecode(res.data)['articles'] as List? ?? [];

      return data
          .map((e) => NewsModel.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      return [];
    }
  }
}
