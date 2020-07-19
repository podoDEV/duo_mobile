import '../../../../../domain/entities/game_category.dart';

class CategoriesGetResponseModel {
  List<GameCategory> categories;

  CategoriesGetResponseModel({this.categories});

  factory CategoriesGetResponseModel.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    return new CategoriesGetResponseModel(
        categories: list
            .map((e) => GameCategoryHelper.getCategoryFromString(e))
            .toList());
  }
}
