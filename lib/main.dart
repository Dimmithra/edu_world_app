import 'package:edu_world_app/pages/splash_screen/splash_page.dart';
import 'package:edu_world_app/providers/Login_SingUpProvider.dart';
import 'package:edu_world_app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDi7Juw8MrwuAC_0O4cGqOsLN-umnXrsqc",
      appId: "1:1032679581962:android:32c13b7df0c3674fbe72f3",
      messagingSenderId: "1032679581962",
      projectId: "edu-world-8e640",
    ),
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthProvider()),
      ChangeNotifierProvider(create: (_) => LoginAndSingUpProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen());
  }
}
