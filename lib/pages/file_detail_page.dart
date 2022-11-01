import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ui_filemanager_app/data/recent_files_json.dart';
import 'package:ui_filemanager_app/theme/colors.dart';

class FileDetailPage extends StatefulWidget {

  final String title;
  final String fileCount;

  const FileDetailPage({
    Key? key,
    required this.title,
    required this.fileCount
  }) : super(key: key);

  @override
  State<FileDetailPage> createState() => _FileDetailPageState();
}

class _FileDetailPageState extends State<FileDetailPage> {

  Widget _getAppBar(){

    String title = '${widget.title} (${widget.fileCount})';

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon: const Icon(
          LineIcons.arrowLeft,
          color: Colors.black,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 17
        ),
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

  Widget _getItemLists(){

    var size = MediaQuery.of(context).size;

    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: List.generate(imageFiles.length, (index){
        return Container(
          width: (size.width - 60) / 2,
          height: (size.width - 50) / 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: (size.width - 60) / 2,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  image: DecorationImage(
                    image: NetworkImage(
                      imageFiles[index]['img'],
                    ),
                    fit: BoxFit.cover,
                  )
                ),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  imageFiles[index]['file_name'],
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
              const SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  imageFiles[index]['file_size'],
                  style: TextStyle(
                      fontSize: 13,
                      color: secondary.withOpacity(0.5),
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _getBody(){
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          _getDateSection(),
          const SizedBox(height: 20,),
          _getItemLists(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: _getAppBar(),
      ),
      body: _getBody(),
    );
  }
}
