import 'entity.dart';

/// An entity which aggregates others.
abstract class AggregateRoot extends Entity {
  /// Instantiates an [AggregateRoot].
  AggregateRoot({String? id, DateTime? created, DateTime? updated})
      : super(id: id, created: created, updated: updated);
}
