import 'package:binny/Tabbar.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:flutter_automation/flutter_automation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String? sc_result;
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
          body: Container(
            padding: const EdgeInsets.all(16), //padding cam screen
            child: TabBarView(
              children: [
                Column(
                  children: [
                    Expanded(
                        child: Container(
                      color: Colors.red,
                      width: double.infinity,
                      child: FloatingActionButton(
                          onPressed: () async {
                            String? cameraScanResult = await scanner.scan();
                            setstate() {
                              sc_result = cameraScanResult;
                            }
                            print(sc_result);
                          },
                          child: Icon(Icons.qr_code_scanner_sharp)),
                    ))
                  ],
                ),
                Text('List barcode item')
              ],
            ),
          ), // Add your body widget here
        ),
      ),
    );
  }
}
