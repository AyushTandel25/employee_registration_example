
import 'package:employee_registration_example/app/models/employee_data_models.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class EmployeeDatabase{

  static final EmployeeDatabase instance = EmployeeDatabase._init();

  static Database? _database;

  EmployeeDatabase._init();

  Future<Database> get database async{
    if(_database!=null) return _database!;
    _database = await initDb("employee_data.db");
    return _database!;
  }

  Future<Database> initDb(String filePath) async{

    final dbPath = await getDatabasesPath();
    final path = join(dbPath,filePath);
    return await openDatabase(path,version: 1,onCreate: _onCreate);

  }

  Future _onCreate(Database db,int version) async{

    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const integerType = "INTEGER NOT NULL";
    const textType = "TEXT NOT NULL";

    await db.execute("CREATE TABLE $tableName ("
        "${EmployeeFields.id} $idType,"
        "${EmployeeFields.name} $textType,"
        "${EmployeeFields.mobileNumber} $textType,"
        "${EmployeeFields.email} $textType,"
        "${EmployeeFields.address} $textType,"
        "${EmployeeFields.state} $textType,"
        "${EmployeeFields.country} $textType,"
        "${EmployeeFields.password} $textType,"
        "${EmployeeFields.pincode} $textType,"
        "${EmployeeFields.age} $integerType,"
        "${EmployeeFields.createdDate} $textType"
        ")");
  }

  Future close() async{
    final db = await instance.database;
    db.close();
  }

  Future<EmployeeData?> registerEmployee(EmployeeData employee) async{
    if(!(await checkEmailExists(employee.email ?? ""))){
      final db = await instance.database;
      final id = await db.insert(tableName, employee.toJson());
      return employee.copy(
        id: id,
      );
    }
    else{
      throw "Email already exists";
    }
  }

  Future<EmployeeData?> getEmployee(int id) async{
    final db = await instance.database;
    final maps = await db.query(tableName,columns: EmployeeFields.values,where: '${EmployeeFields.id}=?',whereArgs: [id]);
    print("results:"+maps.toString());
    if(maps.isNotEmpty) {
      return EmployeeData.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<int?> loginEmployee(String email,String password) async{
    try{
      if(await checkEmailExists(email)){
        final db = await instance.database;
        final maps = await db.query(tableName,
            columns: [EmployeeFields.id],
            where: "${EmployeeFields.email}=? and ${EmployeeFields.password}=?",
            whereArgs: [email, password]);
        print("results:" + maps.toString());
        if (maps.isNotEmpty) {
          return maps.first[EmployeeFields.id] as int;
        } else {
          throw "Wrong credentials";
        }
      }
      else{
        throw "Email not found";
      }
    }
    catch(e){
      rethrow;
    }
  }

  Future<bool> checkEmailExists(String email) async{
    if(email.isNotEmpty){
      final db = await instance.database;
      final maps = await db.query(tableName,
          columns: [EmployeeFields.id],
          where: '${EmployeeFields.email}=?',
          whereArgs: [email]);
      return maps.isNotEmpty;
    }
    return false;
  }
}