import 'package:capybara_game/model/player_model.dart';
import 'package:capybara_game/utils/local_db/database_helper.dart';

class LevelService {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<void> addLevel(PlayerModel level) async {
    await _databaseHelper.insertLevel(level);
  }

  Future<List<PlayerModel>> getAllLevels() async {
    return await _databaseHelper.getLevels();
  }

  Future<PlayerModel?> getDataLevelByLevel(int level) async {
    return await _databaseHelper.getLevelByLevel(level);
  }

  Future<void> updateLevel(PlayerModel level) async {
    await _databaseHelper.updateLevel(level);
  }

  Future<void> deleteLevel(int level) async {
    await _databaseHelper.deleteLevel(level);
  }

  Future<void> deleteAllLevel() async {
    await _databaseHelper.deleteAllLevels();
  }

  Future<void> getListLevelByRatingStar(int star) async {
    await _databaseHelper.getListLevelByRatingStar(star);
  }
}
