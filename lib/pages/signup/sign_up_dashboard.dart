import 'package:edu_world_app/components/common_button.dart';
import 'package:edu_world_app/pages/login/login.dart';
import 'package:edu_world_app/utils/color.dart';
import 'package:edu_world_app/utils/sheard_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SignUpDashBoard extends StatefulWidget {
  const SignUpDashBoard({super.key});

  @override
  State<SignUpDashBoard> createState() => _SignUpDashBoardState();
}

class _SignUpDashBoardState extends State<SignUpDashBoard> {
  @override
  Widget build(BuildContext context) {
    final storage = new FlutterSecureStorage();
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: kBackgroundColor),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage(
                "assets/images/splash_image.png",
              ),
              height: 150,
              width: 150,
            ),
            Text(
              "EDU WORLD",
              style: GoogleFonts.nunitoSans(
                textStyle: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Divider(color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Sign In",
                      style: GoogleFonts.nunitoSans(
                        textStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Divider(color: Colors.white),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.4,
                height: 50,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white),
                  child: InkWell(
                    onTap: () {
                      storage.write(key: kFirstTimeLog, value: 'true');
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                        builder: (context) {
                          return const LoginScreen();
                        },
                      ), (route) => false);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.email_outlined,
                          size: 30,
                          color: Colors.red,
                          fill: 1,
                        ),
                        Text(
                          "Sign In With Email",
                          style: GoogleFonts.nunitoSans(
                            textStyle: TextStyle(
                                fontSize: 20,
                                color: kDefaultTextColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
