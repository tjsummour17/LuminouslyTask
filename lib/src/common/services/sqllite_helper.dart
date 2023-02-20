import 'dart:developer';

import 'package:luminously/src/common/models/user.dart';
import 'package:sqflite/sqflite.dart';

class SqlLightHelper {
  SqlLightHelper._();

  static late Database _database;
  static const String _usersTable = 'USERS';

  static Future<void> initDatabase() async {
    final String databasesPath = await getDatabasesPath();
    final String path = databasesPath + '/app.db';

    await deleteDatabase(path);

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          '''
          CREATE TABLE $_usersTable 
            ( 
               id       INTEGER PRIMARY KEY, 
               name     TEXT, 
               email    TEXT UNIQUE, 
               password TEXT, 
               phone    VARCHAR(14) 
            );
          ''',
        );
      },
    );

    // Insert users
    await _database.transaction((Transaction transaction) async {
      int userId1 = await transaction.rawInsert(
        '''INSERT INTO $_usersTable 
           VALUES     (NULL, 
                      "user1", 
                      "talal@strawhat.com", 
                      "12345678", 
                      "+962775471804") 
        ''',
      );
      log('user1: $userId1');
      int userId2 = await transaction.rawInsert(
        '''INSERT INTO $_usersTable 
           VALUES     (NULL, 
                      "user2", 
                      "talal2@strawhat.com", 
                      "12345678", 
                      "+962775471804") 
        ''',
      );
      log('user2: $userId2');
      int userId3 = await transaction.rawInsert(
        '''INSERT INTO $_usersTable 
           VALUES     (NULL, 
                      "user3", 
                      "talal3@strawhat.com", 
                      "12345678", 
                      "+962775471804") 
        ''',
      );
      log('user2: $userId3');
    });
  }

  static Future<User?> authenticate({
    required String email,
    required String password,
  }) async {
    List<Map<String, dynamic>> maps = await _database.query(
      _usersTable,
      where: 'email LIKE ? AND password = ?',
      whereArgs: [
        email,
        password,
      ],
    );
    if (maps.isNotEmpty) {
      return User.fromJson(maps.first);
    }
    return null;
  }

  Future close() async => _database.close();
}
