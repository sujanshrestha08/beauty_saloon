import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'dart:io';

import 'package:touchofbeauty_flutter/models/cart_model.dart';

class Helper {
  static Helper? _db;

  Future<Helper?> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initinitDatabase();
  }

  initinitDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'cart.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE cart (id INTEGER PRIMARY KEY , productId VARCHAR UNIQUE,productName TEXT,initialPrice INTEGER, productPrice INTEGER , quantity INTEGER, unitTag TEXT , image TEXT )');
  }

  Future<Cart> insert(Cart cart, [Map<String, Object?>? map]) async {
    var dbClient = await db;
    await dbClient?.insert(cart, cart.toMap());
    return cart;
  }

  Future<List<Cart>> getCartList() async {
    var dbClient = await db;
    final List<Map<String, Object?>> queryResult =
        await (dbClient) as List<Map<String, Object?>>;
    return queryResult.map((e) => Cart.fromMap(e)).toList();
  }
}
