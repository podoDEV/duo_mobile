class Member {
  String id;

  Member({this.id});

  factory Member.fromMap(Map<String, dynamic> map) => new Member(id: map['id']);
}
