import 'dart:convert';

import 'package:food_id/model/carousel.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  static var client = http.Client();

  static Future<dynamic> fetchBannerData() async {
    var response =
        await client.get(Uri.parse("http://food.Mockable.Io/v1/banner"));
    if (response.statusCode == 200) {
      return carouselFromJson(response.body);
    } else {
      return null;
    }
  }
}
