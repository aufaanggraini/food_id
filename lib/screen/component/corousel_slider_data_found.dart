import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../model/carousel.dart';

class CarouselSliderDataFound extends StatefulWidget {
  final List<Carousel> carouselList;
  const CarouselSliderDataFound(this.carouselList);

  @override
  _CarouselSliderDataFoundState createState() =>
      _CarouselSliderDataFoundState();
}

class _CarouselSliderDataFoundState extends State<CarouselSliderDataFound> {
  int _current = 0;
  List<Widget> imageSlider;

  List<String> carouselTop = [];
  List<String> carouselSmall = [];

  Future<void> filterCarousel() async {
    widget.carouselList.forEach((element) {
      if (element.variant.slug == "top") {
        carouselTop.add(element.media);
        setState(() {});
      } else {
        carouselSmall.add(element.media);
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    filterCarousel();
    imageSlider = carouselTop
        .map((e) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        CachedNetworkImage(
                          imageUrl: e,
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                              value: downloadProgress.progress,
                            ),
                          ),
                          fit: BoxFit.cover,
                          width: 1000,
                        ),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Expanded(
            child: Container(
              color: Color(
                0xff05C167,
              ),
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/icon_food_id.jpg",
                            height: 40,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "FOOD ID",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.message,
                        color: Colors.white,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                      ),
                      RichText(
                        text: TextSpan(
                          children: const <TextSpan>[
                            TextSpan(
                                text: 'Dikirim ke',
                                style: TextStyle(color: Colors.white)),
                            TextSpan(
                                text: ' Jakarta Selatan',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(children: [
                      Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Mau belanja makanan apa?",
                          style: TextStyle(color: Colors.grey))
                    ]),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  )
                ],
              ),
            ),
            flex: 1,
          ),
          Expanded(
            child: Container(
              child: Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: CarouselSlider(
                          items: imageSlider,
                          options: CarouselOptions(
                              autoPlay: true,
                              aspectRatio: 2.0,
                              enlargeCenterPage: true,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _current = index;
                                });
                              })),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "Special di FOOD.ID",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    Container(
                      height: carouselSmall.length <= 2 ? 160 : 250,
                      child: GridView.count(
                          childAspectRatio: 1.8,
                          primary: true,
                          padding: const EdgeInsets.all(20),
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 2,
                          children: carouselSmall
                              .map(
                                (e) => CachedNetworkImage(
                                  imageUrl: e,
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) => Center(
                                    child: CircularProgressIndicator(
                                      value: downloadProgress.progress,
                                    ),
                                  ),
                                  fit: BoxFit.cover,
                                  width: 1000,
                                ),
                              )
                              .toList()),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "Cari Inspirasi Belanja",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 150,
                                width: 140,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Text(
                                      "Makanan Kaleng",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'https://images.tokopedia.net/img/cache/900/product-1/2020/6/24/6583495/6583495_8e1f3046-191e-4d6a-8566-f709f4550169_1024_1024.jpg'),
                                        fit: BoxFit.cover),
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 150,
                                width: 140,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Text(
                                      "Aneka Saos",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'https://images.tokopedia.net/img/cache/900/product-1/2020/4/16/372567/372567_b5f9cfe2-a5eb-4603-913c-2565674c7d9f_1736_1736.jpg'),
                                        fit: BoxFit.cover),
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ],
                          ),
                          Container(
                            height: 310,
                            width: 210,
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 10, left: 10),
                                child: Text(
                                  "Lagi Trending",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://ik.imagekit.io/tvlk/cul-asset/guys1L+Yyer9kzI3sp-pb0CG1j2bhflZGFUZOoIf1YOBAm37kEUOKR41ieUZm7ZJ/cul-assets-252301483284-b172d73b6c43cddb/culinary/asset/REST_IG%20-720x900-FIT_AND_TRIM-3289c07da99c7e708c14625a18515da4.jpeg?tr=q-40,c-at_max,w-1080,h-1920&amp;_src=imagekit'),
                                    fit: BoxFit.cover),
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }
}
