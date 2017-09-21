import 'entity.dart';

/// An entity which aggregates others.
abstract class AggregateRoot extends Entity {

  /// Instantiates an [AggregateRoot].
  AggregateRoot({String id = null, DateTime created = null, DateTime updated = null})
      : super(id: id, created: created, updated: updated);
}