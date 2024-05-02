import 'package:flutter/material.dart';

//Tabbar widget template
class BinnyTabBar extends StatelessWidget {
  const BinnyTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      dividerColor: null,
      indicator: BoxDecoration(
          color: Color.fromRGBO(2, 194, 117, 100), borderRadius: BorderRadius.circular(300)),
      splashBorderRadius: BorderRadius.circular(300),
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: Colors.white,
      //labelStyle: TextStyle(backgroundColor: Colors.green ),
      unselectedLabelColor: Color.fromRGBO(2, 194, 117, 100),
      unselectedLabelStyle: TextStyle(backgroundColor: null),
      tabAlignment: TabAlignment.center,
      indicatorColor: Colors.green,
      tabs: [
        SizedBox(
            height: 25,
            child:
                Tab(child: Text('บาร์โค้ด', style: TextStyle(fontSize: 17)))),
        SizedBox(
          height: 25,
          child: Tab(
            child: Text(
              'รหัสบาร์โค้ด',
              style: TextStyle(fontSize: 17),
            ),
          ),
        )
      ],
    );
  }
}
