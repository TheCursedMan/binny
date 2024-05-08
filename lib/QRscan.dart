import 'package:binny/Tabbar.dart';
import 'package:binny/productitem.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:flutter_automation/flutter_automation.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Binny',
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              elevation: 0,
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(0), child: BinnyTabBar())),
          body: MyTabBarView(), // Use a separate StatefulWidget for TabBarView
        ),
      ),
    );
  }
}

class MyTabBarView extends StatefulWidget {
  @override
  _MyTabBarViewState createState() => _MyTabBarViewState();
}

class _MyTabBarViewState extends State<MyTabBarView> {
  String? sc_result;
  bool isScan = false;

  void closescreen() {
    isScan = false;
  }

  @override
  void initState() {
    super.initState();
    // Call the scan method automatically when the page is loaded
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final topSpaceHeight = screenHeight / 6;
    return Container(
      padding: const EdgeInsets.all(16),
      child: TabBarView(
        children: [
          Column(children: [
            Expanded(
                child: MobileScanner(
                    allowDuplicates: true,
                    onDetect: (barcode, arg) {
                      if (!isScan) {
                        String code = barcode.rawValue ?? '---';
                        isScan = true;
                        print(code);
                      }
                    }))
          ]),
          Column(
            children: [
              //SizedBox(height: topSpaceHeight),
              Expanded(
                flex: 5,
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context , index){
                    return Column(
                        children: [
                          SizedBox(height: 12),
                          ProductItem(
                            name: 'Product ID ${index}' + '\n' + 'Product Name',
                            imageAsset: 'assets/product${index+1}.png',
                          ),
                          SizedBox(height: 12),
                          Divider(
                            color: Colors.grey,
                            height: 1,
                            indent: 16,
                            endIndent: 16,
                          ),
                    ],
                    );
                  }
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
