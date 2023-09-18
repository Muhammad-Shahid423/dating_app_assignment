import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../common/models/fruit_details.dart';
import 'home_screen_widgets.dart';

class ImageSliderWidget extends StatefulWidget {
  final int verticalIndex;
  final List<FruitDetails> list;
  final PageController parentController;

  const ImageSliderWidget(this.verticalIndex, this.list, this.parentController, {super.key});

  @override
  _ImageSliderWidgetState createState() => _ImageSliderWidgetState();
}

class _ImageSliderWidgetState extends State<ImageSliderWidget> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 0.85);
  }

  @override
  void dispose() {
    _pageController.dispose(); // Dispose the controller when no longer needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: widget.list[widget.verticalIndex].images.length,
        physics: const ClampingScrollPhysics(),
        controller: _pageController,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double value = 0.0;
              if (_pageController.position.haveDimensions) {
                value = index.toDouble() - (_pageController.page ?? 0);
                value = (value * 0.000).clamp(-1, 1);
                print("value $value index $index");
              }
              return Transform.rotate(
                angle: pi * value,
                child: carouselCard(
                    context,
                    widget.list[widget.verticalIndex],
                    index,
                    _pageController,
                    widget.parentController,
                    widget.verticalIndex,
                    (imageIndex) {
                      widget.list.removeAt(imageIndex);
                      setState(() {});
                    }
                ),
              );
            },
          );
          // return carouselView(index, _pageController, context, widget.list[widget.verticalIndex], widget.parentController, widget.verticalIndex);
        });
  }
}