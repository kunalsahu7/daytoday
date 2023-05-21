import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:daytoday/screens/insertpage/controler/IncomeControllor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReadScreen extends StatefulWidget {
  const ReadScreen({Key? key}) : super(key: key);

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  IncomeControllor incomeControllor = Get.put(
    IncomeControllor(),
  );

  @override
  void initState() {
    super.initState();

    incomeControllor.readDate();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: incomeControllor.Screens[incomeControllor.Secrreenindex.value],
        bottomNavigationBar: ConvexAppBar(
          onTap: (index) {
            incomeControllor.Secrreenindex.value = index;
            setState(() {

            });
          },
          backgroundColor: Colors.green,
          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.filter_alt_outlined, title: 'filter'),
          ],
        ),
      ),
    );
  }
}
