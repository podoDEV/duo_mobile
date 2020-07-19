enum GameCategory { league_of_legends, overwatch }

class GameCategoryHelper {
  static GameCategory fromMap(Map<String, dynamic> map) =>
      getCategoryFromString(map['category']);

  static GameCategory getCategoryFromString(String categoryString) {
    for (GameCategory element in GameCategory.values) {
      if (element.toString() == categoryString) {
        return element;
      }
    }
    return null;
  }
}
