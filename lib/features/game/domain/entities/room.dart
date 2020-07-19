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
}
