import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../design/my_colors.dart';

class ImageCarousel extends StatelessWidget {
  final controller = PageController();
  final List imageUrls;

  ImageCarousel(this.imageUrls);

  @override
  Widget build(BuildContext context) {
    final images = imageUrls
        .map((url) => Image.network(
              url,
              fit: BoxFit.cover,
            ))
        .toList();

    // Precache the second image.
    if (images.length > 1) {
      precacheImage(images[1]?.image, context);
    }

    return Stack(children: [
      PageView(
        controller: controller,
        children: images,
        onPageChanged: (index) {
          // Precahce the following image.
          if (index < images.length - 1) {
            precacheImage(images[index + 1].image, context);
          }
        },
      ),
      if (images.length > 1)
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: SmoothPageIndicator(
              controller: controller, // PageController
              count: images.length,
              effect: SlideEffect(
                activeDotColor: MyColors.black,
                dotColor: MyColors.grey,
                dotHeight: 8.0,
                dotWidth: 8.0,
                spacing: 16.0,
              ),
            ),
          ),
        ),
    ]);
  }
}
