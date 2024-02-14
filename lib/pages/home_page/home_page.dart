import 'package:edu_world_app/components/common_edu_card.dart';
import 'package:edu_world_app/pages/home_page/profile_details_page.dart';
import 'package:edu_world_app/pages/home_page/book_record_page.dart';
import 'package:edu_world_app/pages/search/search.dart';
import 'package:edu_world_app/providers/home_provider.dart';
import 'package:edu_world_app/utils/color.dart';
import 'package:edu_world_app/utils/main_body.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   Provider.of<HomeProvider>(context, listen: false).getAllBookData(context);
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) {
          return [
            const StudentDetailsScreen(),
            const BookDetails()
          ][homeProvider.selectedIndex];
        },
      ),
      bottomNavigationBar: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) {
          return BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Global News',
                backgroundColor: Colors.red,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.my_location_outlined),
                label: 'Local News',
                backgroundColor: Colors.green,
              ),
            ],
            backgroundColor: homeProvider.darkMode
                ? appBarDarkModeColor
                : Colors.grey.shade800,
            unselectedItemColor: kdefWhiteColor,
            currentIndex: homeProvider.selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: (int index) async {
              setState(() {
                homeProvider.selectedIndex = index;
              });
            },
          );
        },
      ),
    );
  }
}
