import 'dart:async';
import 'package:logging/logging.dart' as log;
import '../../aggregate_root.dart';
import '../aggregate_root_repository.dart';

/// An in-memory implementation of the Entity repository
class InMemoryAggregateRootRepository<T extends AggregateRoot>
    implements AggregateRootRepository<T> {
  static final log.Logger _logger =
      log.Logger('InMemoryAggregateRootRepository');

  final Map<String, T> _cache = {};

  @override
  Future<T> getById(String id) async {
    _logger.finer("Getting object with ID $id");
    final result = _cache[id];
    if (result == null) {
      throw Exception("Object with ID $id not found");
    }
    return result;
  }

  @override
  Future<dynamic> deleteById(String id) async {
    _logger.finer("Removing object with ID $id");
    _cache.remove(id);
  }

  @override
  Future<dynamic> save(List<T> aggregateRoots) async {
    for (T aggregateRoot in aggregateRoots) {
      _logger.finer("Saving object with ID ${aggregateRoot.id}");
      _cache[aggregateRoot.id] = aggregateRoot;
    }
  }

  @override
  Future<List<T>> getAll() async {
    _logger.finer("Getting all objects");
    return _cache.values.toList();
  }
}
