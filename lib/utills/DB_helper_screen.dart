import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class dbhelper {
  Database? database;

  Future<Database> checkdb() async {
    if (database != null) {
      return database!;
    } else {
      return await initdb();
    }
  }

  Future<Database> initdb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "kamo.db");
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query =
            "CREATE TABLE incomeexpence ( id INTEGER PRIMARY KEY AUTOINCREMENT , category TEXT , amount INTEGER , date TEXT , paytypes TEXT , stats TEXT)";

        db.execute(query);

        String quary1 =
            "CREATE TABLE categorytable (id INTEGER PRIMARY KEY AUTOINCREMENT , cate TEXT)";

        db.execute(quary1);
      },
    );
  }

  // income expance
  insertdb({
    required category,
    required amount,
    required stats,
    required date,
    required paytypes,
  }) async {
    database = await checkdb();
    database!.insert(
      "incomeexpence",
      {
        "category": category,
        "amount": amount,
        "date": date,
        "paytypes": paytypes,
        "stats": stats,
      },
    );
  }

  Future<List<Map>> readdata() async {
    database = await checkdb();
    String quary = "SELECT * FROM incomeexpence";
    List<Map> list = await database!.rawQuery(quary);
    return list;
  }

  Future<void> delateData({
    required id,
  }) async {
    database = await checkdb();

    database!.delete(
      "incomeexpence",
      whereArgs: [id],
      where: "id=?",
    );
  }

  FilterData({required staus}) async {
    database = await checkdb();

    String quary = "SELECT * FROM incomeexpence WHERE $staus";
    database!.rawQuery(quary);
  }

  // category

  void insertCate({
    required cate,
  }) async {
    database = await checkdb();

    database!.insert(
      "cate",
      {
        "cate": cate,
      },
    );
  }

  Future<List<Map>> readCate() async {
    database = await checkdb();

    String quary1 = "SELECT * FROM categorytable";

    List<Map> l1 = await database!.rawQuery(quary1);

    return l1;
  }

  Update({
    required stats,
    required paytypes,
    required date,
    required category,
    required amount,
    required id,
  }) async {
    database = await checkdb();
    database!.update(
      "incomeexpence",
      {
        "category": category,
        "amount": amount,
        "date": date,
        "paytypes": paytypes,
        "stats": stats,
      },
      whereArgs: [id],
      where: "id=?",
    );

    readdata();
  }

  Future<List<Map<String, Object?>>> TotalIncome() {
    String quary = "SELECT SUM(amount) FROM incomeexpence";
    var total = database!.rawQuery(quary);

    return total;
  }
}
