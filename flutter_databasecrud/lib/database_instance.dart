import 'product_model.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DatabaseInstance {
  final String _databaseName = 'database.db';
  final int _databaseVersion = 1;

  final String table = 'product';
  final String id = 'id';
  final String name = 'name';
  final String category = 'category';
  final String createdAt = 'createdAt';
  final String updatedAt = 'updatedAt';

  Database? _database;
  Future<Database> get database async {
    if(_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
      '''
      CREATE TABLE $table (
        $id INTEGER PRIMARY KEY AUTOINCREMENT,
        $name TEXT,
        $category TEXT,
        $createdAt TEXT,
        $updatedAt TEXT 
      ) '''
    );
  }

  Future<List<ProductModel>> all() async {
    final data = await _database?.query(table) ?? [];
    List<ProductModel> result = 
        data.map((e) => ProductModel.fromJson(e)).toList();
    return result;
  }

  Future<int> insert(Map<String, dynamic> row) async {
    print(row);
    final query = await _database?.insert(table,row) ?? 0;
    return query;
  } 

  Future<int> update(int idParam,Map<String, dynamic> row) async {
    final query = await _database?.update(table, row, where: '$id = ?', whereArgs: [idParam]) ?? 0;
    return query;
  }

   Future<int> delete(int idParam) async {
    final query = await _database?.delete(table, where: '$id = ?', whereArgs: [idParam]) ?? 0;
    return query;
  }


}