import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/home_page_response_model.dart';

class  HomePageController extends GetxController{
  Rx<HomepageResModel> homepageresData = HomepageResModel().obs;

  Future<void> onInit() async {
    super.onInit();
    await getNewsData(refresh: true);
  }

  Future getNewsData({required refresh}) async {
    final response = await http.get(
      Uri.parse("https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=0a7bdfe011a74df6b521cbddba406b33"),
    );
    var newsdata = jsonDecode(response.body);
    print(newsdata);
    homepageresData.value = HomepageResModel.fromJson(jsonDecode(response.body));

  }
}