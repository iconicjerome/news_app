import 'package:flutter/material.dart';
import 'package:news_app/api_services.dart';
import 'package:news_app/config.dart';

import 'package:news_app/models/api_models2.dart';
import 'package:news_app/pages/nav_category.dart';
import 'package:news_app/pages/news_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //we use the data from the model class in our code
  //we want a list from the model GetNews

  List<GetNews>? news;

  //create tag to check if the api response has loaded or not
  var _isLoaded = true;
  @override
  void initState() {
    super.initState();
//create method to get API dat
    getData();
  }

  Future<void> getData() async {
    news = await ApiService().getNews();
    setState(() {
      _isLoaded = false;
    });
    print(news);
  }

  // setDark() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   pref.setBool('darktheme', true);
  // }

  // getDark() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   bool isDark = pref.getBool('darktheme') ?? false;
  //   return isDark;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('NewsXtra'),
            IconButton(
                onPressed: () {
                  currentTheme.switchTheme();
                },
                icon: Icon(Icons.wb_sunny_rounded))
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
