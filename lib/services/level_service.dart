import 'package:capybara_game/model/level_model.dart';
import 'package:capybara_game/utils/local_db/database_helper.dart';

class LevelService {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<void> addLevel(LevelModel level) async {
    await _databaseHelper.insertLevel(level);
  }

  Future<List<LevelModel>> getAllLevels() async {
    return await _databaseHelper.getLevels();
  }

  Future<LevelModel?> getLevelByLevel(int level) async {
    return await _databaseHelper.getLevelByLevel(level);
  }

  Future<void> updateLevel(LevelModel level) async {
    await _databaseHelper.updateLevel(level);
  }

  Future<void> deleteLevel(int level) async {
    await _databaseHelper.deleteLevel(level);
  }
}
