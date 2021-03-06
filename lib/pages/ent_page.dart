import 'package:flutter/material.dart';
import 'package:news_app/api_ent.dart';
import 'package:news_app/config.dart';
import 'package:news_app/models/api_models2.dart';
import 'package:news_app/pages/nav_category.dart';
import 'package:news_app/pages/news_details.dart';

class EntPage extends StatefulWidget {
  const EntPage({Key? key}) : super(key: key);

  @override
  State<EntPage> createState() => _EntPageState();
}

class _EntPageState extends State<EntPage> {
  List<GetNews>? news;
  var newIcon = Icons.wb_sunny;

  //create tag to check if the api response has loaded or not
  var _isLoaded = true;
  @override
  void initState() {
    super.initState();
//create method to get API dat
    getData();
  }

  Future<void> getData() async {
    news = await EntService().getNews();
    setState(() {
      _isLoaded = false;
    });
    // print(news);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('    NewsXtra \n Entertainment'),
            IconButton(
              icon: Icon(newIcon),
              onPressed: () {
                currentTheme.switchTheme();
                setState(() {});
              },
            )
          ],
        ),
      ),
      body: _isLoaded
          ? Center(
              child: CircularProgressIndicator(
              color: Colors.black87,
            ))
          : RefreshIndicator(
              color: Colors.black87,
              onRefresh: getData,
              child: ListView.builder(
                  itemCount: news?.length,
                  itemBuilder: ((context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return NewsDetails(data: news?[index]);
                        }));
                      },
                      child: Card(
                        elevation: 20,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          width: double.infinity,
                          child: Column(
                            children: [
                              Image.network(
                                news?[index].image ??
                                    "https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                                height: 300,
                                fit: BoxFit.fitHeight,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Report by: ${news?[index].author ?? 'AP Reporter'}',
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                news?[index].title ?? 'N/A',
                                style: TextStyle(
                                  height: 1.8,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  })),
            ),
    );
  }
}
