import '../../../account/domain/entities/member.dart';
import 'game_category.dart';

class Room {
  String id;
  GameCategory category;
  String createdAt;
  String meetAt;
  Member owner;
  String title;
  List<Member> attendeeList;

  Room(
      {this.id,
      this.category,
      this.createdAt,
      this.meetAt,
      this.owner,
      this.title,
      this.attendeeList});

  factory Room.fromMap(Map<String, dynamic> map) => new Room(
      id: map['id'],
      category: map['category'],
      createdAt: map['createAt'],
      meetAt: map['meetAt'],
      owner: map['owner'],
      title: map['title']);
}
