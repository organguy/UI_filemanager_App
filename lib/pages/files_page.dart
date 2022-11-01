import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ui_filemanager_app/data/category_json.dart';
import 'package:ui_filemanager_app/pages/file_detail_page.dart';
import 'package:ui_filemanager_app/theme/colors.dart';
import 'package:line_icons/line_icon.dart';

class FilesPage extends StatefulWidget {
  const FilesPage({Key? key}) : super(key: key);

  @override
  State<FilesPage> createState() => _FilesPageState();
}

class _FilesPageState extends State<FilesPage> {

  int pageIndex = 0;

  Widget _getTabs(){
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 55,
      decoration: BoxDecoration(
        color: secondary.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12)  
      ),
      child: Row(
        children: [
          pageIndex == 0
            ? Flexible(
              child: ElasticIn(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      pageIndex = 0;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      width: (size.width - 45) / 2,
                      height: 50,
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: const Center(
                        child: Text(
                          'My Cloud',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
            : GestureDetector(
              onTap: (){
                setState(() {
                  pageIndex = 0;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  width: (size.width - 45) / 2,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Center(
                    child: Text(
                      'My Cloud',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: secondary.withOpacity(0.5)
                      ),
                    ),
                  ),
                ),
              ),
            ),
          pageIndex == 1
            ? Flexible(
              child: ElasticIn(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      pageIndex = 1;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      width: (size.width - 45) / 2,
                      height: 50,
                      decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: const Center(
                        child: Text(
                          'Team Cloud',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
            : GestureDetector(
              onTap: (){
                setState(() {
                  pageIndex = 1;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  width: (size.width - 45) / 2,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Center(
                    child: Text(
                      'Team Cloud',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: secondary.withOpacity(0.5)
                      ),
                    ),
                  ),
                ),
              ),
        ),
        ],
      ),
    );
  }

  Widget _getDateSection(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: const [
            Text(
              'Date Modified',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(width: 2,),
            Icon(
              LineIcons.arrowDown,
              size: 20,
            )
          ],
        ),
        IconButton(
          onPressed: (){},
          icon: Icon(
            LineIcons.borderAll,
            color: Colors.black.withOpacity(0.5),
          )
        ),
      ],
    );
  }

  Widget _getListMyCloudItems(){

    var size = MediaQuery.of(context).size;

    return Wrap(
      runSpacing: 20,
      spacing: 20,
      children: List.generate(myCloudFilesContentJson.length, (index) {
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_) => FileDetailPage(
              title: myCloudFilesContentJson[index]['title'],
              fileCount: myCloudFilesContentJson[index]['file_count'],
            )));
          },
          child: Container(
            width: (size.width - 50) / 2,
            height: (size.width - 50) / 2,
            decoration: BoxDecoration(
              color: secondary.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  myCloudFilesContentJson[index]['img'],
                  width: 55,
                ),
                const SizedBox(height: 15,),
                Text(
                  '${myCloudFilesContentJson[index]['title']} ( ${myCloudFilesContentJson[index]['file_count']} )',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _getListTeamCloudItems(){

    var size = MediaQuery.of(context).size;

    return Wrap(
      runSpacing: 20,
      spacing: 20,
      children: List.generate(teamCloudFilesContentJson.length, (index) {
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_) => FileDetailPage(
                title: teamCloudFilesContentJson[index]['title'],
                fileCount: teamCloudFilesContentJson[index]['file_count'],
            )));
          },
          child: Container(
            width: (size.width - 50) / 2,
            height: (size.width - 50) / 2,
            decoration: BoxDecoration(
              color: secondary.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  teamCloudFilesContentJson[index]['img'],
                  width: 55,
                ),
                const SizedBox(height: 15,),
                Text(
                  '${teamCloudFilesContentJson[index]['title']} ( ${teamCloudFilesContentJson[index]['file_count']} )',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _getBody(){
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const SizedBox(height: 20,),
            _getTabs(),
            const SizedBox(height: 30,),
            _getDateSection(),
            const SizedBox(height: 20,),
            pageIndex == 0
            ? _getListMyCloudItems()
            : _getListTeamCloudItems()
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _getBody(),
    );
  }
}
