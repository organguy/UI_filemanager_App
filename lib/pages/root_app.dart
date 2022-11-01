
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:ui_filemanager_app/data/root_app_json.dart';
import 'package:ui_filemanager_app/pages/files_page.dart';
import 'package:ui_filemanager_app/pages/home_page.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {

  int pageIndex = 0;

  Widget _getBody(){
    return IndexedStack(
      index: pageIndex,
      children: const [
        HomePage(),
        FilesPage(),
        Center(
          child: Text(
            'Trash Page',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Center(
          child: Text(
            'Account Page',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
        )
      ],
    );
  }

  Widget _getTabs(){
    return SalomonBottomBar(
        currentIndex: pageIndex,
        onTap: (index){
          setState(() {
            pageIndex = index;
          });
        },
        items: List.generate(rootAppJson.length, (index) =>
            SalomonBottomBarItem(
              selectedColor: rootAppJson[index]['color'],
              icon: SvgPicture.asset(
                rootAppJson[index]['icon'],
                color: rootAppJson[index]['color'],
              ),
              title: Text(rootAppJson[index]['text']),
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: _getTabs(),
      body: _getBody(),
    );
  }
}
