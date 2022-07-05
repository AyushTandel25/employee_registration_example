import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService{

  static final SharedPreferenceService instance = SharedPreferenceService._init();

  SharedPreferenceService._init();

  SharedPreferences? _sharedPref;

  Future<SharedPreferences> get sharedPref async{
    if(_sharedPref!=null) _sharedPref!;
    _sharedPref = await SharedPreferences.getInstance();
    return _sharedPref!;
  }

  static const String EMPLOYEE_ID = "EMPLOYEE_ID";
  static const String IS_LOGIN = "IS_LOGIN";

  Future<void> setEmployeeId(int id) async {
    var ins = await instance.sharedPref;
    ins.setInt(EMPLOYEE_ID, id);
  }

  Future<int?> getEmployeeId() async{
    var ins = await instance.sharedPref;
    return ins.getInt(EMPLOYEE_ID);
  }

  Future<void> setLoggedIn() async {
    var ins = await instance.sharedPref;
    ins.setBool(IS_LOGIN, true);
  }

  Future<bool> isLoggedIn() async{
    var ins = await instance.sharedPref;
    return ins.getBool(IS_LOGIN) ?? false;
  }

  Future clearReferences() async{
    var ins = await instance.sharedPref;
    ins.clear();
  }

}