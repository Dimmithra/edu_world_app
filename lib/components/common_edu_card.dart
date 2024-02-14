import 'package:cached_network_image/cached_network_image.dart';
import 'package:edu_world_app/providers/home_provider.dart';
import 'package:edu_world_app/utils/color.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonEduCard extends StatelessWidget {
  const CommonEduCard({
    super.key,
    required this.mainTitle,
    required this.imageUrl,
    required this.errorWidget,
    this.onTap,
    this.shareBtn,
    required this.auther,
    this.onterData,
  });
  final String mainTitle;
  final String imageUrl;
  final Widget errorWidget;
  final Function()? onTap;
  final Function()? shareBtn;
  final String auther;
  final String? onterData;
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        return InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(),
            child: Card(
              color: homeProvider.getDarkTheme
                  ? const Color.fromARGB(255, 105, 105, 105)
                  : const Color.fromARGB(255, 247, 244, 244),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .8,
                              child: Text(
                                mainTitle,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: homeProvider.darkMode
                                      ? kdefWhiteColor
                                      : kDefaultTextColor,
                                ),
                              ),
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * .13,
                                child: IconButton(
                                  onPressed: shareBtn,
                                  icon: Icon(Icons.more_vert,
                                      color: homeProvider.getDarkTheme
                                          ? Colors.white
                                          : kDefaultTextColor),
                                ))
                          ],
                        ),
                        Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl: imageUrl,
                              height: 100,
                              width: 100,
                              placeholder: (context, url) {
                                return const CircularProgressIndicator();
                              },
                              errorWidget: (context, url, error) {
                                return errorWidget;
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width / 1.9,
                                child: Text(
                                  "${onterData!.isEmpty ? "" : onterData}",
                                  style: GoogleFonts.abel(
                                    textStyle: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Text(
                                auther,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ),
                            // SizedBox(
                            //   width: MediaQuery.of(context).size.width * 0.5,
                            //   child: Text(
                            //     "${onterData == null ? "" : onterData}",
                            //     style: TextStyle(
                            //       fontSize: 11,
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
