import 'package:flutter/material.dart';
import 'package:news_app/pages/ent_page.dart';
import 'package:news_app/pages/home_page.dart';
import 'package:news_app/pages/sports_page.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'CATEGORY',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Divider(
                thickness: 5,
              ),
              ListTile(
                leading: Icon(Icons.newspaper),
                title: Text(
                  'General',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HomePage();
                  }));
                },
              ),
              ListTile(
                leading: Icon(Icons.sports_soccer_outlined),
                title: Text(
                  'Sports',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SportPage();
                  }));
                },
              ),
              ListTile(
                leading: Icon(Icons.text_snippet_outlined),
                title: Text(
                  'Entertainment',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return EntPage();
                  }));
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
