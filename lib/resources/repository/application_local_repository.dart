import 'dart:async';

import 'package:baru_nih/models/unit.dart';
import 'package:baru_nih/resources/repository/storage_manager.dart';

class ApplicationLocalRepository {
  final StorageManager _storageManager = StorageManager();

  Future<Unit> getSavedUnit() async {
    return _storageManager.getUnit();
  }

  void saveUnit(Unit unit) {
    _storageManager.saveUnit(unit);
  }

  Future<int> getSavedRefreshTime() async {
    return _storageManager.getRefreshTime();
  }

  void saveRefreshTime(int refreshTime) {
    _storageManager.saveRefreshTime(refreshTime);
  }

  Future<int> getLastRefreshTime() {
    return _storageManager.getLastRefreshTime();
  }

  void saveLastRefreshTime(int lastRefreshTime) {
    _storageManager.saveLastRefreshTime(lastRefreshTime);
  }
}
