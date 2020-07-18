class DuoResponseModel<T> {
  T data;

  DuoResponseModel({this.data});

  factory DuoResponseModel.fromMap(Map<String, dynamic> map) {
    return new DuoResponseModel(data: map['data']);
  }
}
