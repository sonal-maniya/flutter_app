import 'package:realm/realm.dart';
part 'post.g.dart';

@RealmModel()
class _Post {
  int userId;
  int id;
  String title;
  String description;
}
