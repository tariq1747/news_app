import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/res/res.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:news_app/utils/utils.dart';
import 'package:news_app/view_model/view_model.dart';
import 'package:news_app/widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String route = '/home';
  static const String updateId = 'News-list-view';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('News'),
        ),
        body: GetBuilder<HomeController>(
          builder: (controller) => Padding(
            padding: Dimens.edgeInsets16,
            child: Column(
              children: [
                CustomTextField(
                  controller: controller.textcontroller,
                  hintText: 'Search',
                  onFieldSubmit: (String value) {
                    controller.fetchNews(q: value);
                  },
                ),
                Dimens.boxHeight20,
                TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  dividerHeight: 0,
                  indicatorColor: Colors.transparent,
                  labelPadding: Dimens.edgeInsetsL2,
                  overlayColor:
                      const WidgetStatePropertyAll(Colors.transparent),
                  controller: controller.tabController,
                  onTap: (index) {
                    controller.categoryType = NewsCategorys.values[index];
                    controller.fetchNews(category: controller.categoryType);
                  },
                  tabs: [
                    ...NewsCategorys.values.map(
                      TabBarButton.new,
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller.tabController,
                    children: [
                      ...NewsCategorys.values.map(
                        (e) => _PostListing(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class _PostListing extends StatelessWidget {
  const _PostListing({
    super.key,
  });

  @override
  Widget build(BuildContext context) => GetX<HomeController>(
        builder: (controller) => SmartRefresher(
          controller: controller.refreshController,
          enablePullDown: true,
          enablePullUp: true,
          onRefresh: () =>
              controller.fetchNews(category: controller.categoryType),
          onLoading: () => controller.fetchNews(
              category: controller.categoryType,
              page: controller.newsList.length ~/ 10),
          child: controller.newsList.isEmpty
              ? const Center(
                  child: Text('No Data'),
                )
              : ListView.separated(
                  itemBuilder: (context, index) {
                    var details = controller.newsList[index];
                    return NewsCard(
                        image: details.urlToImage ?? '',
                        title: details.title ?? '');
                  },
                  itemCount: controller.newsList.length,
                  separatorBuilder: (context, index) => Dimens.boxHeight20,
                ),
        ),
      );
}
