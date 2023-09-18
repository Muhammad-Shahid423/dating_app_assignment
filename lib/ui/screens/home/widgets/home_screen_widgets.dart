import 'package:dating_app_assignment/common/models/fruit_details.dart';
import 'package:dating_app_assignment/common/widgets/flutter_toast.dart';
import 'package:flutter/material.dart';

import '../../../../common/values/colors.dart';
import '../../../../common/widgets/base_text_widget.dart';
import '../../../../ui/screens/home/widgets/tag_widget.dart';

Widget carouselCard(BuildContext context, FruitDetails fruit, int index, PageController _pageController, PageController parentController, int parentIndex, void Function(int imageIndex) onDrag) {
  return GestureDetector(
    onTap: () {
      if (index == 0) {
        toastInfo(msg: "101 Main Profile 01");
      } else if (index == 1) {
        toastInfo(msg: "102 Main Profile 02");
      } else {
        toastInfo(msg: "103 Main Profile 03");
      }
    },
    child: Container(
      margin: const EdgeInsets.only(left: 10.0, top: 35, right: 10, bottom: 45),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        border: Border.all(color: AppColors.primarySecondaryBG, width: 0.5),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                  image: NetworkImage(
                      fruit.images[index]
                  ),
                  fit: BoxFit.cover
              ),
            ),
            foregroundDecoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.transparent, Colors.transparent, Colors.transparent, Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0, 0, 0.5, 1],
                ),
                borderRadius: BorderRadiusGeometry.lerp(const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)), const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)), 30)
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: GestureDetector(
              onTap: () {
                if (index > 0) {
                  _pageController.animateToPage(
                      index - 1,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeIn);
                }
              },
              child: Container(
                width: 100, // Adjust the size of the sensitive area
                height: 100,
                color: Colors.transparent,
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: GestureDetector(
              onTap: () {
                if (index < fruit.images.length) {
                  _pageController.animateToPage(
                      index + 1,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeIn);
                } else {
                  toastInfo(msg: "110 No Cards");
                }
              },
              child: Container(
                width: 100, // Adjust the size of the sensitive area
                height: 100,
                color: Colors.transparent,
              ),
            ),
          ),
          Positioned(
            top: 15,
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 25),
              height: 3,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: fruit.images.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int i) {
                    return Container(
                      width: 60,
                      height: 3,
                      margin: const EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                          color: i == index ? AppColors.primaryElement : AppColors.primarySecondaryBG,
                          borderRadius: const BorderRadius.all(Radius.circular(10))
                      ),
                    );
                  }),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(6, 2, 10, 2),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color(0xff202020)),
                    color: const Color(0xff000000),
                    borderRadius:
                    BorderRadius.circular(100),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/ic_icon_grey.png',
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 3),
                      reuseAbleText(fruit.likeCount.toString(), fontWeight: FontWeight.normal)
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    reuseAbleText(fruit.name.toString(), size: 30),
                    const SizedBox(width: 5),
                    reuseAbleText(fruit.age.toString(), fontWeight: FontWeight.normal, size: 25)
                  ],
                ),
                index == 0
                    ? SizedBox(width: 200, child: reuseAbleText(fruit.location.toString(), fontWeight: FontWeight.w300))
                    : index == 1 ? SizedBox(width: 200, child: reuseAbleText(fruit.description + fruit.description, fontWeight: FontWeight.w300))
                    : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: generateTags(fruit),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 60,
            right: 20,
            child: Image.asset("assets/icons/ic_heart.png"),
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: GestureDetector(
              onTap: () {
                parentController.animateToPage(
                    parentIndex + 1,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeIn);
              },
              child: const Padding(
                padding: EdgeInsets.only(bottom: 12.0),
                child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: AppColors.primaryElementText
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

List<String> tagIcons = [
  'assets/icons/ic_heart_red.png',
  'assets/icons/ic_glass.png',
  'assets/icons/ic_smoke.png',
  'assets/icons/ic_muscles.png',
  'assets/icons/ic_handshake.png',
];

List<Widget> generateTags(FruitDetails fruitDetails) {
  List<Widget> widgets = [];

  for (int i = 0; i < fruitDetails.tags.length; i++) {
    // Generate widgets inside the loop
    if (i == 0) {
      widgets.add(
        tagWidget(fruitDetails.tags[i], borderColor: AppColors.primaryElement, bgColor: AppColors.primaryElement.withOpacity(0.3), icon: tagIcons[i]),
      );
    } else if (i%2 != 0) {
      if (i + 1 < fruitDetails.tags.length) {
        widgets.add(
            Row(
              children: [
                tagWidget(fruitDetails.tags[i], icon: tagIcons[i]),
                const SizedBox(width: 5),
                tagWidget(fruitDetails.tags[i+1], icon: tagIcons[i+1]),
              ],
            )
        );
        i++;
      } else {
        widgets.add(
          tagWidget(fruitDetails.tags[i], icon: tagIcons[i]),
        );
      }
    } else {
      widgets.add(
        tagWidget(fruitDetails.tags[i], icon: tagIcons[i]),
      );
    }
  }

  return widgets;
}

Widget noCardsWidget() {
  return Expanded(
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          reuseAbleText("추천 드릴 친구들을 준비 중이에요", size: 20),
          const SizedBox(height: 5),
          reuseAbleText("매일 새로운 친구들을 소개시켜드려요", fontWeight: FontWeight.w300),
        ],
      ),
    ),
  );
}