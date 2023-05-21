import 'package:daytoday/screens/insertpage/controler/IncomeControllor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  IncomeControllor incomeControllor = Get.put(IncomeControllor());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Obx(
                  () =>
                  DropdownButton(
                    value: incomeControllor.Filter.value,
                    items: [
                      DropdownMenuItem(child: Text("Income"), value: "0"),
                      DropdownMenuItem(child: Text("Expnces"), value: "1"),
                    ],
                    onChanged: (value) {
                      incomeControllor.Filter.value = value!;
                      incomeControllor.Filterdata(staus: value);
                    },
                  ),
            )
          ],
          backgroundColor: Colors.green,
        ),
        body: Obx(
              () =>
              ListView.builder(
                itemCount: incomeControllor.incomeExapnce.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: incomeControllor.incomeExapnce[index]['stats'] ==
                            "0"
                            ? Colors.green.shade200
                            : Colors.red.shade200,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Category : ${incomeControllor
                                      .incomeExapnce[index]['category']}",
                                ),
                                Text(
                                  "Amount : ${incomeControllor
                                      .incomeExapnce[index]['amount']}",
                                ),
                                Text(
                                  "Pay Types : ${incomeControllor
                                      .incomeExapnce[index]['paytypes']}",
                                ),
                                Text(
                                  "Date : ${incomeControllor
                                      .incomeExapnce[index]['date']}",
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    TextEditingController txtcate =
                                    TextEditingController(
                                        text:
                                        "${incomeControllor
                                            .incomeExapnce[index]['category']}");
                                    TextEditingController txtAmount =
                                    TextEditingController(
                                        text:
                                        "${incomeControllor
                                            .incomeExapnce[index]['amount']}");
                                    TextEditingController txtdata =
                                    TextEditingController(
                                        text:
                                        "${incomeControllor
                                            .incomeExapnce[index]['date']}");
                                    String paytypes =
                                        "${incomeControllor
                                        .incomeExapnce[index]['paytypes']}";
                                    String status = "${incomeControllor
                                        .incomeExapnce[index]['stats']}";
                                    Get.defaultDialog(
                                      content: Column(
                                        children: [
                                          TextField(
                                            controller: txtcate,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(10),
                                              ),
                                            ),
                                          ),
                                          TextField(
                                            controller: txtAmount,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(10),
                                              ),
                                            ),
                                          ),
                                          TextField(
                                            controller: txtdata,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(10),
                                              ),
                                            ),
                                          ),
                                          DropdownButton(
                                            value: paytypes,
                                            isExpanded: true,
                                            items: [
                                              DropdownMenuItem(
                                                child: Text(
                                                  "Online",
                                                ),
                                                value: "online",
                                              ),
                                              DropdownMenuItem(
                                                child: Text(
                                                  "Offline",
                                                ),
                                                value: "offline",
                                              ),
                                            ],
                                            onChanged: (value) {
                                              paytypes = value!;
                                            },
                                          ),
                                          DropdownButton(
                                            value: status,
                                            isExpanded: true,
                                            items: [
                                              DropdownMenuItem(
                                                child: Text(
                                                  "Income",
                                                ),
                                                value: "0",
                                              ),
                                              DropdownMenuItem(
                                                child: Text(
                                                  "Expance",
                                                ),
                                                value: "1",
                                              ),
                                            ],
                                            onChanged: (value) {
                                              status = value!;
                                            },
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              incomeControllor.UpdateData(
                                                  stats: status,
                                                  paytypes: paytypes,
                                                  date: txtdata.text,
                                                  category: txtcate.text,
                                                  amount: txtAmount.text,
                                                  id: incomeControllor
                                                      .incomeExapnce[index]['id']);

                                              incomeControllor.readDate();
                                              Get.back();
                                            },
                                            child: Text("Update"),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.green,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  icon: Icon(Icons.edit),
                                ),
                                IconButton(
                                  onPressed: () {
                                    incomeControllor.delateData(
                                        id: incomeControllor
                                            .incomeExapnce[index]
                                        ['id']);

                                    print(incomeControllor.incomeExapnce[index]
                                    ['id']);

                                    incomeControllor.readDate();
                                  },
                                  icon: Icon(Icons.delete),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
        ),
      ),
    );
  }
}
