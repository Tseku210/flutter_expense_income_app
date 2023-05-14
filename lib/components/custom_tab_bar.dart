import 'package:flutter/material.dart';

class CustomTabBar2 extends StatefulWidget {
  final String text1;
  final String text2;
  final Widget widget1;
  final Widget widget2;
  final double height;
  final double width;
  const CustomTabBar2({
    super.key,
    required this.text1,
    required this.text2,
    required this.widget1,
    required this.widget2,
    required this.height,
    required this.width,
  });

  @override
  State<CustomTabBar2> createState() => _CustomTabBar2State();
}

class _CustomTabBar2State extends State<CustomTabBar2>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: Column(
        children: [
          Container(
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.grey[200],
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              labelColor: Colors.black,
              padding: const EdgeInsets.all(5),
              tabs: [
                Tab(
                  text: widget.text1,
                ),
                Tab(text: widget.text2),
              ],
            ),
          ),
          SizedBox(
            height: widget.height,
            width: 400,
            // color: Colors.white,
            child: TabBarView(
              controller: _tabController,
              children: [
                widget.widget1,
                widget.widget2,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
