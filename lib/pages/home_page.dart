import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_filemanager_app/data/category_json.dart';
import 'package:ui_filemanager_app/data/recent_files_json.dart';
import 'package:ui_filemanager_app/theme/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Widget _getStorageBox(){
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(22)
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -40,
            right: -30,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -10,
            left: -50,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 120,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: CircleProgressBar(
                      foregroundColor: white,
                      backgroundColor: white.withOpacity(0.2),
                      value: 0.68,
                      child: const Center(
                        child: AnimatedCount(
                          count: 0.68,
                          unit: '%',
                          duration: Duration(milliseconds: 500),
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15,),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          '10.8 GB of 15 GB used',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                            child: Text(
                              'Buy Storage',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getRecentFiles(){

    var size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recent Files',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600
            ),
          ),
          const SizedBox(height: 20,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(recentFilesJson.length, (index) {

                var fileType = 'assets/icons/image.svg';
                if(recentFilesJson[index]['type'] == 'image'){
                  fileType = 'assets/icons/image.svg';
                }else if(recentFilesJson[index]['type'] == 'video'){
                  fileType = 'assets/icons/video.svg';
                }

                return Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Container(
                      width: size.width * 0.6,
                      height: 160,
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(22),
                        image: DecorationImage(
                          image: NetworkImage(recentFilesJson[index]['img']),
                          fit: BoxFit.cover,
                        )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          BlurryContainer(
                            blur: 5,
                            padding: EdgeInsets.zero,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(22),
                              bottomRight: Radius.circular(22),
                            ),
                            child: Container(
                              width: size.width * 0.6,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          fileType,
                                          color: Colors.white,
                                          width: 15,
                                        ),
                                        const SizedBox(width: 10,),
                                        Text(
                                          recentFilesJson[index]['file_name'],
                                          style: TextStyle(
                                            color: Colors.white.withOpacity(0.8)
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getCategoryFiles(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Category',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600
            ),
          ),
          const SizedBox(height: 20,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(categoryJson.length, (index){
                return Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Container(
                    height: 150,
                    width: 140,
                    decoration: BoxDecoration(
                      color: secondary.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(22)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          categoryJson[index]['img'],
                          width: 40,
                        ),
                        const SizedBox(height: 10,),
                        Text(
                          categoryJson[index]['text'],
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Text(
                          categoryJson[index]['file_count'],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: secondary.withOpacity(0.5)
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }

  Widget _getBody(){
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15,),
            _getStorageBox(),
            const SizedBox(height: 30,),
            _getRecentFiles(),
            const SizedBox(height: 30,),
            _getCategoryFiles(),
          ],
        ),
      )
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