import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/res/res.dart';
import 'package:news_app/utils/utils.dart';
import 'package:news_app/view_model/view_model.dart';

class TabBarButton extends StatelessWidget {
  const TabBarButton(
    this.type, {
    super.key,
  });

  final NewsCategorys type;

  @override
  Widget build(BuildContext context) => GetX<HomeController>(
        builder: (controller) {
          var isSelected = type == controller.categoryType;
          return DecoratedBox(
            decoration: BoxDecoration(
              color:
                  isSelected ? ColorsValue.primaryColor : Colors.grey.shade100,
              borderRadius: BorderRadius.circular(Dimens.eighty),
            ),
            child: Padding(
              padding: Dimens.edgeInsets16,
              child: Text(
                type.label,
                style: context.textTheme.titleSmall?.copyWith(
                  color: isSelected
                      ? ColorsValue.whiteColor
                      : ColorsValue.blackColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      );
}
