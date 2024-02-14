import 'package:edu_world_app/components/common_button.dart';
import 'package:edu_world_app/components/common_textfeild.dart';
import 'package:edu_world_app/pages/signup/signup.dart';
import 'package:edu_world_app/providers/Login_SingUpProvider.dart';
import 'package:edu_world_app/providers/home_provider.dart';
import 'package:edu_world_app/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer2<LoginAndSingUpProvider, HomeProvider>(
        builder: (context, loginAndSingUpProvider, homeProvider, child) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: kBackgroundColor),
            ),
            child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 5),
                child: Form(
                  key: formKey,
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
                                    fontSize: 22,
                                    // color: kDefaultTextColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                "Login",
                                style: GoogleFonts.abel(
                                  textStyle: const TextStyle(
                                    fontSize: 22,
                                    // color: kDefaultTextColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              CommonTextFeild(
                                hinttext: "Enter Email Addrees",
                                label: "Enter Email Addrees",
                                emailValidation: true,
                                validation: true,
                                controller: loginAndSingUpProvider
                                    .loginEmailConteroller,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CommonTextFeild(
                                hinttext: "Enter Password",
                                label: "Enter Password",
                                validation: true,
                                isPassword: true,
                                controller: loginAndSingUpProvider
                                    .loginPasswordConteroller,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              loginAndSingUpProvider.getloadingLoginProcess
                                  ? const CircularProgressIndicator()
                                  : SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.1,
                                      child: CommonBtn(
                                        onPress: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            loginAndSingUpProvider
                                                .loginProcess(context);
                                          }
                                        },
                                        btnName: "Sign In",
                                        backgroundColor: Colors.blue,
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
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return const SignUp();
                                            },
                                          ),
                                        );
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Don't have an account? ",
                                            style: GoogleFonts.nunitoSans(
                                              textStyle: const TextStyle(
                                                  fontSize: 14,
                                                  // color: kDefaultTextColor,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Text(
                                            "Sign UP",
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
                )),
          );
        },
      ),
    );
  }
}
