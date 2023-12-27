// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class PostTable extends _PostTable
    with RealmEntity, RealmObjectBase, RealmObject {
  PostTable(
    int userId,
    int id,
    String title,
    String description,
  ) {
    RealmObjectBase.set(this, 'userId', userId);
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'description', description);
  }

  PostTable._();

  @override
  int get userId => RealmObjectBase.get<int>(this, 'userId') as int;
  @override
  set userId(int value) => RealmObjectBase.set(this, 'userId', value);

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  String get description =>
      RealmObjectBase.get<String>(this, 'description') as String;
  @override
  set description(String value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  Stream<RealmObjectChanges<PostTable>> get changes =>
      RealmObjectBase.getChanges<PostTable>(this);

  @override
  PostTable freeze() => RealmObjectBase.freezeObject<PostTable>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(PostTable._);
    return const SchemaObject(ObjectType.realmObject, PostTable, 'PostTable', [
      SchemaProperty('userId', RealmPropertyType.int),
      SchemaProperty('id', RealmPropertyType.int),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('description', RealmPropertyType.string),
    ]);
  }
}
