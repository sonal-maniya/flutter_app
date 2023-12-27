import 'package:realm/realm.dart';
part 'post.g.dart';

@RealmModel()
class _PostTable {
  late int userId;
  late int id;
  late String title;
  late String description;
}
