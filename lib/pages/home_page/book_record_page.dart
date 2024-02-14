import 'package:edu_world_app/components/common_edu_card.dart';
import 'package:edu_world_app/pages/pdfview/pdf_viewer.dart';
import 'package:edu_world_app/pages/search/search.dart';
import 'package:edu_world_app/providers/home_provider.dart';
import 'package:edu_world_app/utils/color.dart';
import 'package:edu_world_app/utils/main_body.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class StudentDetailsScreen extends StatefulWidget {
  const StudentDetailsScreen({super.key});

  @override
  State<StudentDetailsScreen> createState() => _StudentDetailsScreenState();
}

class _StudentDetailsScreenState extends State<StudentDetailsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeProvider>(context, listen: false).getAllBookData(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: "Home Page",
      leading: IconButton(
          onPressed: () {
            setState(() {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const SearchScreen();
                },
              ));
            });
          },
          icon: const Icon(
            Icons.search,
            size: 25,
          )),
      actions: [
        Consumer<HomeProvider>(
          builder: (context, homeProvider, child) {
            return IconButton(
              onPressed: () async {
                await homeProvider.toggleTheme();
              },
              icon: Icon(
                size: 25,
                homeProvider.darkMode
                    ? Ionicons.moon_sharp
                    : Ionicons.sunny_sharp,
                color: homeProvider.darkMode
                    ? Colors.yellow.shade700
                    : Colors.white,
              ),
              iconSize: 30,
            );
          },
        )
      ],
      appbarTitleColor: kdefWhiteColor,
      body: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) {
          if (homeProvider.getloadingHomepageData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return homeProvider.getallBookDataModel!.data!.isNotEmpty
              ? ListView.builder(
                  itemCount: homeProvider.getallBookDataModel!.data!.length,
                  itemBuilder: (context, index) {
                    return CommonEduCard(
                      mainTitle:
                          "${homeProvider.getallBookDataModel!.data![index].bookName}",
                      imageUrl:
                          "${homeProvider.getallBookDataModel!.data![index].firebaseImage}",
                      errorWidget: const Image(
                        image: AssetImage("assets/images/book.png"),
                        height: 50,
                        width: 50,
                      ),
                      auther: " ",
                      shareBtn: () {
                        homeProvider.shareRecord(
                            context,
                            homeProvider
                                .getallBookDataModel!.data![index].firebaseUrl);
                      },
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => PDFViwe(homeProvider.getallBookDataModel!.data![index].firebaseUrl)));
                       // Navigator.push(context, PDFViwe(homeProvider.getallBookDataModel!.data![index].firebaseUrl));
                      },
                      // onterData: "publishDate",
                    );
                  },
                )
              : Container();
        },
      ),
    );
  }
}
