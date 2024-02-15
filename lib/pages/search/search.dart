import 'package:edu_world_app/components/common_edu_card.dart';
import 'package:edu_world_app/components/common_textfeild.dart';
import 'package:edu_world_app/pages/pdfview/pdf_viewer.dart';
import 'package:edu_world_app/providers/home_provider.dart';
import 'package:edu_world_app/utils/edu_world_message.dart';
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
      Provider.of<HomeProvider>(context, listen: false)
          .clearSearchData(context);
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
          return Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: CommonTextFeild(
                      controller: homeProvider.getesearchController,
                      hinttext: "Enter Book Name",
                      label: "Search By Book Name",
                      fullborder: true,
                      onChanged: (p0) {
                        homeProvider.getAllSearchData(context);
                      },
                      suffixIcon: homeProvider.getloadingAllCadData
                          ? CircularProgressIndicator()
                          : IconButton(
                              onPressed: () {
                                // if (homeProvider
                                //     .getesearchController.text.isEmpty) {
                                //   eduWorldMessage(context,
                                //           errorTxt:
                                //               "Search feild cannot be blank")
                                //       .show();
                                // } else {
                                homeProvider.getAllSearchData(context);
                                // }
                              },
                              icon: Icon(Icons.search),
                            ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 120,
              ),
              homeProvider.getallCategorModelData != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 85),
                      child: ListView.builder(
                        itemCount:
                            homeProvider.getallCategorModelData!.data!.length,
                        itemBuilder: (context, index) {
                          return CommonEduCard(
                            mainTitle:
                                "${homeProvider.getallCategorModelData!.data![index].bookName}",
                            imageUrl:
                                "${homeProvider.getallCategorModelData!.data![index].firebaseImage!.isNotEmpty}",
                            errorWidget: const Image(
                              image: AssetImage("assets/images/book.png"),
                              height: 50,
                              width: 50,
                            ),
                            auther: " ",
                            shareBtn: () {
                              homeProvider.shareRecord(
                                  context,
                                  homeProvider.getallCategorModelData!
                                      .data![index].firebaseUrl);
                            },
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PDFViwe(homeProvider
                                      .getallCategorModelData!
                                      .data![index]
                                      .firebaseUrl)));
                              // Navigator.push(context, PDFViwe(homeProvider.getallBookDataModel!.data![index].firebaseUrl));
                            },
                            onterData:
                                "${homeProvider.getallCategorModelData!.data![index].description}",
                          );
                        },
                      ),
                    )
                  : Container()
            ],
          );
        },
      ),
    );
  }
}
