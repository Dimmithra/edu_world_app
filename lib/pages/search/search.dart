import 'package:edu_world_app/components/common_edu_card.dart';
import 'package:edu_world_app/components/common_textfeild.dart';
import 'package:edu_world_app/pages/pdfview/pdf_viewer.dart';
import 'package:edu_world_app/providers/home_provider.dart';
import 'package:edu_world_app/utils/main_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeProvider>(context, listen: false).getAllCatsData(context);
      Provider.of<HomeProvider>(context, listen: false).getAllBookData(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: "search",
      automaticallyImplyLeading: true,
      body: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.21,
                      child: CommonTextFeild(
                        hinttext: "Search",
                        label: "Search",
                        fullborder: true,
                        suffixIcon: IconButton(
                          onPressed: () {
                            homeProvider.getAllBookData(context);
                          },
                          icon: Icon(Icons.search),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return Stack(
                              children: [
                                Container(
                                  height: 200,
                                  color: Color.fromARGB(255, 175, 175, 175),
                                  child: Center(
                                    child: ListView.builder(
                                      itemCount: homeProvider
                                          .getallCategorModelData!.data!.length,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {},
                                          child: Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                  "${homeProvider.getallCategorModelData!.data![index].name}",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.red),
                                  child: IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      )),
                                )
                              ],
                            );
                          },
                        );
                      },
                      icon: Icon(Icons.filter_list_outlined, size: 25),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80,
                ),
                // ListView.builder(
                //   itemBuilder: (context, index) {
                //     return homeProvider.getallBookDataModel!.data!.isNotEmpty
                //         ? ListView.builder(
                //             itemCount:
                //                 homeProvider.getallBookDataModel!.data!.length,
                //             itemBuilder: (context, index) {
                //               return CommonEduCard(
                //                 mainTitle:
                //                     "${homeProvider.getallBookDataModel!.data![index].bookName}",
                //                 imageUrl:
                //                     "${homeProvider.getallBookDataModel!.data![index].firebaseImage}",
                //                 errorWidget: const Image(
                //                   image: AssetImage("assets/images/book.png"),
                //                   height: 50,
                //                   width: 50,
                //                 ),
                //                 auther: " ",
                //                 shareBtn: () {
                //                   homeProvider.shareRecord(
                //                       context,
                //                       homeProvider.getallBookDataModel!
                //                           .data![index].firebaseUrl);
                //                 },
                //                 onTap: () {
                //                   Navigator.of(context).push(MaterialPageRoute(
                //                       builder: (context) => PDFViwe(homeProvider
                //                           .getallBookDataModel!
                //                           .data![index]
                //                           .firebaseUrl)));
                //                   // Navigator.push(context, PDFViwe(homeProvider.getallBookDataModel!.data![index].firebaseUrl));
                //                 },
                //                 onterData:
                //                     "${homeProvider.getallBookDataModel!.data![index].description}",
                //               );
                //             },
                //           )
                //         : Container();
                //   },
                // )
              ],
            ),
          );
        },
      ),
    );
  }
}
