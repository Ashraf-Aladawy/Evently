import 'package:easy_localization/easy_localization.dart';

class BoardingModel {
  String image;
  String title;
  String body;

  BoardingModel({required this.image, required this.title, required this.body});

  static List<BoardingModel> boardingItems = [
    BoardingModel(
        image: "assets/images/onBording1.png",
        title: "onboarding_1_title".tr(),
        body: "onboarding_1_body".tr()),
    BoardingModel(
        image: "assets/images/onBoarding2.png",
        title: "onboarding_2_title".tr(),
        body: "onboarding_2_body".tr()),
    BoardingModel(
        image: "assets/images/onBoarding3.png",
        title: "onboarding_3_title".tr(),
        body: "onboarding_3_body".tr()),
  ];
}
