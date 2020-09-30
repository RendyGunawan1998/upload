import 'dart:async';

import 'package:baru_nih/models/unit.dart';
import 'package:baru_nih/resources/config/ids.dart';
import 'package:baru_nih/utils/date_time_helper.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  final Logger _logger = Logger("StorageManager");
  static final StorageManager _instance = StorageManager._internal();

  StorageManager._internal();

  factory StorageManager() {
    return _instance;
  }

  Future<Unit> getUnit() async {
    try {
      var sharedPreferences = await SharedPreferences.getInstance();
      int unit = sharedPreferences.getInt(Ids.storageUnitKey);
      if (unit == null) {
        return Unit.metric;
      } else {
        if (unit == 0) {
          return Unit.metric;
        } else {
          return Unit.imperial;
        }
      }
    } catch (exc, stackTrace) {
      _logger.warning("Exception: $exc stack trace: $stackTrace");
      return Unit.metric;
    }
  }

  saveUnit(Unit unit) async {
    try {
      var sharedPreferences = await SharedPreferences.getInstance();
      _logger.log(Level.FINE, "Store unit $unit");
      int unitValue = 0;
      if (unit == Unit.metric) {
        unitValue = 0;
      } else {
        unitValue = 1;
      }

      sharedPreferences.setInt(Ids.storageUnitKey, unitValue);
    } catch (exc, stackTrace) {
      _logger.warning("Exception: $exc stack trace: $stackTrace");
    }
  }

  void saveRefreshTime(int refreshTime) async {
    try {
      var sharedPreferences = await SharedPreferences.getInstance();
      _logger.log(Level.FINE, "Save refresh time: $refreshTime");

      sharedPreferences.setInt(Ids.storageRefreshTimeKey, refreshTime);
    } catch (exc, stackTrace) {
      _logger.warning("Exception: $exc stack trace: $stackTrace");
    }
  }

  Future<int> getRefreshTime() async {
    try {
      var sharedPreferences = await SharedPreferences.getInstance();
      int refreshTime = sharedPreferences.getInt(Ids.storageRefreshTimeKey);
      if (refreshTime == null || refreshTime == 0) {
        refreshTime = 600000;
      }
      return refreshTime;
    } catch (exc, stackTrace) {
      _logger.warning("Exception: $exc stack trace: $stackTrace");
      return 600000;
    }
  }

  void saveLastRefreshTime(int lastRefreshTime) async {
    try {
      var sharedPreferences = await SharedPreferences.getInstance();
      _logger.log(Level.FINE, "Save refresh time: $lastRefreshTime");
      sharedPreferences.setInt(Ids.storageLastRefreshTimeKey, lastRefreshTime);
    } catch (exc, stackTrace) {
      _logger.warning("Exception: $exc stack trace: $stackTrace");
    }
  }

  Future<int> getLastRefreshTime() async {
    try {
      var sharedPreferences = await SharedPreferences.getInstance();
      int lastRefreshTime =
          sharedPreferences.getInt(Ids.storageLastRefreshTimeKey);
      if (lastRefreshTime == null || lastRefreshTime == 0) {
        lastRefreshTime = DateTimeHelper.getCurrentTime();
      }
      return lastRefreshTime;
    } catch (exc, stackTrace) {
      _logger.warning("Exception: $exc stack trace: $stackTrace");
      return DateTimeHelper.getCurrentTime();
    }
  }
}
