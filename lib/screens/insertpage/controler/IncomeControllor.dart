import 'package:daytoday/screens/Filter/View/FilterScreen.dart';
import 'package:daytoday/screens/Home/View/HomeScreen.dart';
import 'package:daytoday/screens/insertpage/Income_screen/view/Income_screen_ui.dart';
import 'package:daytoday/utills/DB_helper_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class IncomeControllor extends GetxController {
  TextEditingController txtamount = TextEditingController();
  TextEditingController txtCate = TextEditingController();
  TextEditingController txtdate = TextEditingController(
    text:
        "${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}",
  );

  RxInt status = 0.obs;

  RxString Filter = "0".obs;

  RxString payTypes = "online".obs;
  Rx<DateTime?> from = DateTime.now().obs;

  RxList incomeExapnce = [].obs;
  RxList cateList = [].obs;

  List Screens = [
    HomeScreen(),
    FilterScreen(),
  ];
  RxInt Secrreenindex = 0.obs;

  dbhelper db = dbhelper();

  void insertDate({
    required category,
    required amount,
    required stats,
    required date,
    required paytypes,
  }) {
    db.insertdb(
      category: category,
      amount: amount,
      stats: stats,
      date: date,
      paytypes: paytypes,
    );
  }

  Future<void> readDate() async {
    incomeExapnce.value = await db.readdata();
  }

  void delateData({
    required id,
  }) {
    db.delateData(id: id);

    readDate();
  }

  // cate

  void insertCate({
    required cate,
  }) {
    db.insertCate(cate: cate);
  }

  Future<void> readCate() async {
    cateList.value = await db.readCate();
  }

  void Filterdata({required staus}) {
    db.FilterData(staus: staus);
  }

  void UpdateData({
    required stats,
    required paytypes,
    required date,
    required category,
    required amount,
    required id,
  }) {
    db.Update(
        stats: stats,
        paytypes: paytypes,
        date: date,
        category: category,
        amount: amount,
        id: id);
  }

  var total;
  void TotalIncome() {
    total = db.TotalIncome();
    print(total);
  }
}
