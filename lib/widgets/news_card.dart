import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/res/res.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    required this.image,
    required this.title,
  });
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) => Container(
      width: Get.width,
      height: Dimens.twoHundredTwenty,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.sixteen),
        color: ColorsValue.blackColor,
        image: DecorationImage(
          image: CachedNetworkImageProvider(image),
          fit: BoxFit.cover,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      alignment: Alignment.bottomCenter,
      child: Container(
        width: Get.width,
        padding: Dimens.edgeInsets10,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(Dimens.eight)),
          color: ColorsValue.whiteColor,
        ),
        child: Text(
          title,
          style: Styles.black16,
        ),
      ));
}
