import 'package:flutter/material.dart';
import 'package:flutter_assignment/news/NewsController.dart';
import 'package:flutter_assignment/news/news_res.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

class NewsDetails extends StatelessWidget {
  NewsDetails({Key? key}) : super(key: key);
  final controller = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    Articles item = controller.getSelectedArticle();
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    (item.urlToImage != null)
                        ? Image.network(
                            item.urlToImage!,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.width / 2,
                            fit: BoxFit.fill,
                          )
                        : Container(),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      item.title??"N/a",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(item.description??"N/A",
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400)),const SizedBox(
                      height: 10,
                    ),
                    Text(item.content??"N/A",
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400)),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              DateFormat('dd MMM yyyy hh:mm:a').format(
                                  DateTime.parse(item.publishedAt??"/").toLocal()),
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w800),
                            ),
                            Flexible(
                              child: Text(
                                "Author: ${item.author??"N/A"}",
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w800),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: "share",
                  onPressed: () {
                    Share.share(item.url!);
                  },
                  child: Icon(
                    Icons.share
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                FloatingActionButton(
                  heroTag: "open",

                  onPressed: () {

                controller.openUrl(item.url);

                  },
                  child: Icon(
                      Icons.outbond
                  ),
                ),
                SizedBox(
                  width: 20,
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
