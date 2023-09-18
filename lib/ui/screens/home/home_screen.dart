import 'package:dating_app_assignment/common/values/colors.dart';
import 'package:dating_app_assignment/common/widgets/base_text_widget.dart';
import 'package:dating_app_assignment/ui/screens/home/bloc/home_event.dart';
import 'package:dating_app_assignment/ui/screens/home/widgets/home_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_bloc.dart';
import 'bloc/home_state.dart';
import 'widgets/images_slider_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController();
  int currentPage = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeInitialState) {
          context.read<HomeBloc>().add(const HomeDataFetched());
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeSuccessState) {
          if (state.listOfUserData.isEmpty) {
            return Center(
              child: noCardsWidget(),
            );
          } else {
            return Container(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              decoration: const BoxDecoration(
                color: AppColors.primaryBackground,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                            children: [
                              Image.asset(
                                'assets/icons/ic_location.png',
                                width: 16,
                                height: 20,
                              ),
                              const SizedBox(width: 6),
                              RichText(
                                text: reuseAbleTextSpan("", size: 14, fontWeight: FontWeight.w300, children: [
                                  reuseAbleTextSpan("목이길어슬픈기린", fontWeight: FontWeight.w700),
                                  reuseAbleTextSpan("님", fontWeight: FontWeight.w300),
                                  const TextSpan(
                                    text: '의 ',
                                  ),
                                  reuseAbleTextSpan("새로운", fontWeight: FontWeight.w300),
                                  reuseAbleTextSpan("스팟", fontWeight: FontWeight.w700),
                                ]),
                              ),
                            ]
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(6, 4, 8, 4),
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
                                    'assets/icons/ic_star.png',
                                    width: 20,
                                    height: 20,
                                  ),
                                  reuseAbleText("323,233", fontWeight: FontWeight.w500)
                                ],
                              ),
                            ),
                            Image.asset(
                              'assets/icons/ic_notification.png',
                              width: 28,
                              height: 28,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      child: PageView.builder(
                      scrollDirection: Axis.vertical, // Scroll vertically
                      itemCount: state.listOfUserData.length, // Number of vertical pages
                      controller: pageController,
                      itemBuilder: (BuildContext context, int verticalIndex) {
                          return ImageSliderWidget(verticalIndex, state.listOfUserData, pageController);
                      },
                    ),
                  )
                ],
              ),
            );
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
