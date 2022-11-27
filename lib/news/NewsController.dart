import 'dart:convert';

import 'package:flutter_assignment/network/ApiAdapter.dart';
import 'package:flutter_assignment/news/news_res.dart';
import 'package:flutter_assignment/news/news_details.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class NewsController extends GetxController {
  RxList newsList = [].obs;
  RxInt selectedIndex =0.obs;
  RxBool isLoading= false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchNews();
    super.onInit();
  }

  void setSelected(index){
    selectedIndex(index);
    Get.toNamed("/newsDetails");
  }

  Articles getSelectedArticle(){
    return newsList[selectedIndex.value];

  }

  void fetchNews() async {
    isLoading(true);
    http.Response res = await ApiProvider().makeHttpGetRequest(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=7502218d123b407b92e37ee5c21c8b2f");
    NewsResponse response = NewsResponse.fromJson(jsonDecode(res.body));
    if(response.articles!= null){
      newsList.assignAll(response.articles!);
    }
    isLoading(false);
  }
  Future<void> openUrl(url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {

    }
  }
}
