import 'package:edu_world_app/components/common_button.dart';
import 'package:edu_world_app/pages/login/login.dart';
import 'package:edu_world_app/providers/home_provider.dart';
import 'package:edu_world_app/utils/color.dart';
import 'package:edu_world_app/utils/main_body.dart';
import 'package:edu_world_app/utils/sheard_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BookDetails extends StatefulWidget {
  const BookDetails({super.key});

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  final storage = new FlutterSecureStorage();
  @override
  void initState() {
    // String? email = await storage.read(key: kEmail);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, value, child) {
        return MainBody(
          title: "My Profile",
          appbarTitleColor: kdefWhiteColor,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kdefWhiteColor,
                ),
                child: const Image(
                  image: AssetImage(
                    "assets/images/splash_image.png",
                  ),
                  height: 50,
                  width: 50,
                ),
              ),
            ),
          ],
          body: Consumer<HomeProvider>(
            builder: (context, homeProvider, child) {
              return Padding(
                padding: const EdgeInsets.only(top: 80),
                child: SingleChildScrollView(
                  child: Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: MediaQuery.of(context).size.height / 1.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: homeProvider.getDarkTheme
                              ? Color.fromARGB(255, 0, 10, 102)
                              : Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              // const Image(
                              //   image: AssetImage(
                              //     "assets/images/profile.png",
                              //   ),
                              //   height: 100,
                              //   width: 100,
                              // ),
                              Text(
                                "Welcome",
                                style: GoogleFonts.abel(
                                  textStyle: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                "EDU WORLD",
                                style: GoogleFonts.abel(
                                  textStyle: const TextStyle(
                                    fontSize: 22,
                                    // color: kDefaultTextColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              // CommonBtn(
                              //   onPress: () {
                              //     FirebaseAuth.instance.signOut();
                              //     Navigator.pushAndRemoveUntil(context,
                              //         MaterialPageRoute(
                              //       builder: (context) {
                              //         return LoginScreen();
                              //       },
                              //     ), (route) => false);
                              //   },
                              //   btnName: "Sing Out",
                              //   fontColor: kDefaultTextColor,
                              //   backgroundColor: homeProvider.darkMode
                              //       ? Colors.white
                              //       : Colors.lightBlueAccent,
                              // )
                            ],
                          ),
                        )),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
