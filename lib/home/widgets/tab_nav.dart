import 'package:flutter/material.dart';

class TabNav extends StatelessWidget {
  final Size size;
  final TabController tabController;
  const TabNav({
    super.key,
    required this.tabController,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
                isScrollable: true,
                controller: tabController,
                labelColor: Colors.black,
                dividerColor: Colors.transparent,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(width: 5, color: Colors.deepOrange),
                  insets: EdgeInsets.symmetric(horizontal: 15.0),
                ),
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(
                    child: Text(
                      "All",
                      style: TextStyle(fontSize: size.height * 0.02),
                    ),
                  ),
                   Tab(
                    child: Text(
                      "Newest",
                      style: TextStyle(fontSize: size.height * 0.02),
                    ),
                  ),
                   Tab(
                    child: Text(
                      "Popular",
                      style: TextStyle(fontSize: size.height * 0.02),
                    ),
                  ),
                   Tab(
                    child: Text(
                      "Man",
                      style: TextStyle(fontSize: size.height * 0.02),
                    ),
                  ),
                   Tab(
                    child: Text(
                      "Woman",
                      style: TextStyle(fontSize: size.height * 0.02),
                    ),
                  ),
                ]),
          ),
        ),
      ],
    );
  }
}
