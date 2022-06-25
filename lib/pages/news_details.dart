import 'package:flutter/material.dart';
import 'package:news_app/models/api_models2.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({Key? key, this.data}) : super(key: key);
  final GetNews? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('NewsXtra Details'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Column(
                children: [
                  Image.network(data?.image ??
                      "https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Report by: ${data?.author ?? 'AP Reporter'}',
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    data?.title ?? 'N/A',
                    style: TextStyle(
                      height: 1.8,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    data?.content ?? 'N/A',
                    style: TextStyle(
                      height: 1.8,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
