import 'dart:async';
import '../aggregate_root.dart';

/// Interface for a data store repository for Entities
abstract class AggregateRootRepository<T extends AggregateRoot> {
  /// Gets an Entity by its ID
  Future<T> getById(String id);

  /// Saves an Entity
  Future<dynamic> save(List<T> aggregateRoots);

  /// Deletes an Entity by its ID
  Future<dynamic> deleteById(String id);

  /// Gets all Entities in the repository
  Future<List<T>> getAll();
}
