import 'package:flutter/material.dart';
import 'package:timo_stores/home/screens/all_product.dart';
import 'package:timo_stores/home/widgets/productswidgetholder.dart';

import '../widgets/tab_nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 5, vsync: this);
    final size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(35, 10, 35, 0),
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(10)),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(
                  'assets/images/advert2.jpg',
                  fit: BoxFit.fill,
                )),
          ),
        ),
        SizedBox(
          height: size.height * .01,
        ),
        TabNav(
          tabController: tabController,
          size: size,
        ),
        SizedBox(
          height: size.height,
          width: size.width,
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: size.height * 0.02, vertical: 5),
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                AllProduct(
                  size: size,
                ),
                const PrroductWidgetHolder(
                    text: 'No item has been added here please check back'),
                const PrroductWidgetHolder(
                    text: 'No item has been added here please check back'),
                const PrroductWidgetHolder(
                    text: 'No item has been added here please check back'),
                const PrroductWidgetHolder(
                    text: 'No item has been added here please check back'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
