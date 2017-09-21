import 'package:uuid/uuid.dart';

/// An entity, a thing which persists and has an ID.
abstract class Entity {

  /// The unique, persisting ID of this entity.
  String id;

  /// When this entity was created
  DateTime created;

  /// When this entity was updated in the data store
  DateTime updated;

  /// Instantiates an [Entity].
  Entity({this.id = null, this.created = null, this.updated = null}) {
    if (id == null) {
      final Uuid uuid = new Uuid();
      id = uuid.v1(); // Time-based UUID, to play nicely with databases.
    }
    created ??= new DateTime.now().toUtc();
  }

  /// Whether or not this is a newly-created entity
  bool get isNew => updated == null;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Entity &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode => id.hashCode;
}
