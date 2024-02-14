import 'package:edu_world_app/components/common_button.dart';
import 'package:edu_world_app/components/common_textfeild.dart';
import 'package:edu_world_app/pages/login/login.dart';
import 'package:edu_world_app/providers/Login_SingUpProvider.dart';
import 'package:edu_world_app/providers/home_provider.dart';
import 'package:edu_world_app/utils/color.dart';
import 'package:edu_world_app/utils/main_body.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: "Sign Up",
      // appBarColor: appBarColor,
      appbarTitleColor: kdefWhiteColor,
      body: Consumer2<LoginAndSingUpProvider, HomeProvider>(
        builder: (context, loginAndSingUpProvider, homeProvider, child) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Form(
              key: formKey,
              child: Center(
                child: Container(
                    // width: MediaQuery.of(context).size.width / 1.1,
                    // height: MediaQuery.of(context).size.height / 1.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: homeProvider.getDarkTheme
                          ? Color.fromARGB(255, 0, 10, 102)
                          : Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Image(
                            image: AssetImage(
                              "assets/images/splash_image.png",
                            ),
                            height: 100,
                            width: 100,
                          ),
                          Text(
                            "EDU WORLD",
                            style: GoogleFonts.abel(
                              textStyle: const TextStyle(
                                fontSize: 24,
                                // color: homeProvider.getDarkTheme
                                //     ? Colors.white
                                //     : kDefaultTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            "Sign Up",
                            style: GoogleFonts.abel(
                              textStyle: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          CommonTextFeild(
                            hinttext: "Enter Username",
                            label: "Enter Username",
                            controller:
                                loginAndSingUpProvider.usernameController,
                            validation: true,
                          ),
                          CommonTextFeild(
                            hinttext: "Enter Email Addrees",
                            label: "Enter Email Addrees",
                            controller: loginAndSingUpProvider.emailConteroller,
                            emailValidation: true,
                            validation: true,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CommonTextFeild(
                            hinttext: "Enter Password",
                            label: "Enter Password",
                            controller:
                                loginAndSingUpProvider.passwordConteroller,
                            validation: true,
                            isPassword: true,
                          ),
                          CommonTextFeild(
                            hinttext: "Conform Password",
                            label: "Conform Password",
                            controller: loginAndSingUpProvider
                                .conformPasswordConteroller,
                            validation: true,
                            isPassword: true,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          loginAndSingUpProvider.loadingSignProcess
                              ? const CircularProgressIndicator()
                              : SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.1,
                                  child: CommonBtn(
                                    onPress: () {
                                      if (formKey.currentState!.validate()) {
                                        loginAndSingUpProvider
                                            .validateSignUpData(context);
                                      }
                                    },
                                    btnName: "Sign Up",
                                    fontColor: kdefWhiteColor,
                                    backgroundColor: kSubmitteBtnColor,
                                  ),
                                ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 30,
                              child: Container(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushAndRemoveUntil(context,
                                        MaterialPageRoute(
                                      builder: (context) {
                                        return const LoginScreen();
                                      },
                                    ), (route) => false);
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Don you have an account? ",
                                        style: GoogleFonts.nunitoSans(
                                          textStyle: const TextStyle(
                                              fontSize: 14,
                                              color: kDefaultTextColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        "Sign In",
                                        style: GoogleFonts.nunitoSans(
                                          textStyle: const TextStyle(
                                              fontSize: 16,
                                              color: Color.fromARGB(
                                                  255, 0, 27, 100),
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
                    )),
              ),
            ),
          );
        },
      ),
    );
  }
}
