import 'package:flutter/material.dart';
import 'package:food_id/screen/component/corousel_slider_data_found.dart';
import 'package:food_id/screen/component/loading_component.dart';
import 'package:get/get.dart';

import '../controller/carousel_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GetBuilder<HomeController>(
            builder: (_c){
              if(_c.isLoading)
                if(_c.carouselData.length>0)
                  return CarouselSliderDataFound(_c.carouselData);
                else
                  return CarouselLoading();
              else
                if(_c.carouselData.length>0)
                  return CarouselSliderDataFound(_c.carouselData);
                else
                  return Container();
            },
          )
      ),
    );
  }}