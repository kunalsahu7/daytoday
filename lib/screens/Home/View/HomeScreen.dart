import 'package:daytoday/screens/insertpage/controler/IncomeControllor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  IncomeControllor incomeControllor = Get.put(
    IncomeControllor(),
  );

  @override
  void initState() {
    super.initState();

    incomeControllor.TotalIncome();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Day to Day Expence",
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, color: Colors.white),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.green),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.navigate_before,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.white,
                      )),
                  Text("may,2023", style: TextStyle(color: Colors.white)),
                  Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.navigate_next, color: Colors.white)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150,
                width: double.infinity,
                // margin: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green.shade500),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Total Income",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Rs.00",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150,
                width: double.infinity,
                //  margin: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red.shade500,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Total Expence",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Rs.00",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    alignment: Alignment.center,
                    child: Text("Cate Name"),
                  ),
                  Container(
                    width: 100,
                    alignment: Alignment.center,
                    child: Text("Amount"),
                  ),
                  Container(
                    width: 100,
                    alignment: Alignment.center,
                    child: Text("payTypes"),
                  ),
                  Container(
                    width: 100,
                    alignment: Alignment.center,
                    child: Text("Date"),
                  ),
                ],
              ),
            ),
            Obx(
              () => Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        color: incomeControllor.incomeExapnce[index]['stats'] ==
                                "0"
                            ? Colors.green.shade200
                            : Colors.red.shade200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 100,
                              alignment: Alignment.center,
                              child: Text(
                                  "${incomeControllor.incomeExapnce[index]['category']}"),
                            ),
                            Container(
                              width: 50,
                              alignment: Alignment.center,
                              child: Text(
                                  "${incomeControllor.incomeExapnce[index]['amount']}"),
                            ),
                            Container(
                              width: 50,
                              alignment: Alignment.center,
                              child: Text(
                                  "${incomeControllor.incomeExapnce[index]['paytypes']}"),
                            ),
                            Container(
                              width: 100,
                              alignment: Alignment.center,
                              child: Text(
                                  "${incomeControllor.incomeExapnce[index]['date']}"),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: incomeControllor.incomeExapnce.length,
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed('/Income');
          },
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
