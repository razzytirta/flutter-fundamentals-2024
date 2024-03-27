import 'dart:math';

import 'package:belajar_widget_slider/ui/widgets/movie_box.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double currentPageValue = 0;
  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.6);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPageValue = pageController.page;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> urls = [
      "https://images-na.ssl-images-amazon.com/images/I/A1hFzTczzJL._SL1500.jpg",
      "https://www.joblo.com/wp-content/uploads/2023/12/furiosa-poster-400x600.jpg",
      "https://www.joblo.com/wp-content/uploads/2024/01/damsel-season4-400x600.jpg",
      "https://www.joblo.com/wp-content/uploads/2024/02/cabrini-movie-400x600.jpg",
      "https://www.joblo.com/wp-content/uploads/2024/01/spaceman-poster-400x600.jpg",
      "https://www.joblo.com/wp-content/uploads/2022/07/dune-part-2-poster-400x600.jpg",
      "https://www.joblo.com/wp-content/uploads/2024/03/one-life-poster-400x600.jpg",
      "https://www.joblo.com/wp-content/uploads/2024/01/immaculate-poster-1-400x600.jpg"
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Belajar Widget Slider"),
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: urls.length,
        itemBuilder: (context, index) {
          double difference = index - currentPageValue;
          if (difference < 0) {
            difference *= -1;
          }
          difference = min(1, difference);
          return Center(
              child: MovieBox(
            urls[index],
            scale: 1 - (difference - 0.3),
          ));
        },
      ),
    );
  }
}
