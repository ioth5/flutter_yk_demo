import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:yk_demo/public.dart';
import 'home_model.dart';

class HomeBanner extends StatelessWidget {
  final List<BannerInfo> banner;

  HomeBanner(this.banner);

  @override
  Widget build(BuildContext context) {
    if (banner == null) {
      return SizedBox();
    }

    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: CarouselSlider(
        items: banner.map((info) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: Screen.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Image.network(
                    info.pic_url ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          );
        }).toList(),
        options: CarouselOptions(
          // aspectRatio: 2,
          viewportFraction: 1,
          height: 173,
          autoPlay: true,
        ),
      ),
    );
  }
}
