import 'package:edu_world_app/components/common_textfeild.dart';
import 'package:edu_world_app/utils/main_body.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: "search",
      automaticallyImplyLeading: true,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: [
            CommonTextFeild(
              hinttext: "Search",
              label: "Search",
              fullborder: true,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
