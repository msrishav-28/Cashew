import 'package:budget/database/tables.dart';
import 'package:budget/controllers/syncController.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

late String clientID;
late FinanceDatabase database;
SyncController? syncController;
late SharedPreferences sharedPreferences;
final uuid = Uuid();
