import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarouseSlider extends StatelessWidget {
  const CustomCarouseSlider({super.key, required this.avatars});

  final List<String> avatars;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: avatars.map((e) => Image.asset(e, fit: BoxFit.scaleDown)).toList(),

      options: CarouselOptions(
        height: MediaQuery.sizeOf(context).height * .19,
        aspectRatio: 16 / 9,
        viewportFraction: .40,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: true,
        enlargeCenterPage: true,
        enlargeFactor: 0.35,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
