import 'package:edu_world_app/utils/main_body.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: "Home Page",
      body: SingleChildScrollView(),
    );
  }
}
