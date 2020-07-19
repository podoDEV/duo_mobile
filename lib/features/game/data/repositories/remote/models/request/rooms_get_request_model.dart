import '../../../../../../../core/networking/mappable.dart';
import '../../../../../domain/usecases/get_rooms_usecase.dart';

class RoomsGetRequestModel extends RequestMappable {
  final String category;
  int pageNumber = 0;
  int pageSize = 30;

  RoomsGetRequestModel({this.category, this.pageNumber});

  factory RoomsGetRequestModel.fromParams(RoomsGetParams params) {
    return new RoomsGetRequestModel(
        category: params.category.toString(), pageNumber: params.pageNumber);
  }

  @override
  Map<String, dynamic> toJson() =>
      {'category': category, 'pageNumber': pageNumber, 'pageSize': pageSize};
}
