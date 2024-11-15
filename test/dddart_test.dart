import 'dart:async';
import 'package:dddart/dddart.dart';
import 'package:test/test.dart';
import 'package:logging/logging.dart' as log;

/// A simple test class
class Person extends AggregateRoot {
  /// The name of a person
  String name;

  /// The age of a person
  int age;

  /// Instantiates a person
  Person(this.name, this.age,
      {String? id, DateTime? created, DateTime? updated})
      : super(id: id, created: created, updated: updated);
}

Future<dynamic> main() async {
  log.Logger.root.level = log.Level.ALL;
  log.Logger.root.onRecord.listen((log.LogRecord rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });

  test('Aggregate Root Repo', () async {
    final AggregateRootRepository<Person> personRepo =
        InMemoryAggregateRootRepository<Person>();

    final Person p1 = Person("Bob", 10);
    final Person p2 = Person("Jimmy", 20, id: "123ABC");

    expect(p1.name, "Bob");
    expect(p1.age, 10);
    expect(p1.id, isNotNull);
    expect(p2.name, "Jimmy");
    expect(p2.age, 20);
    expect(p2.id, "123ABC");

    await personRepo.save(<Person>[p1]);

    final Person ptest1 = await personRepo.getById(p1.id);
    expect(p1.id, ptest1.id);
    expect(p1.name, ptest1.name);
    ptest1.name = "Bob2";
    await personRepo.save(<Person>[ptest1]);
    final Person ptest2 = await personRepo.getById(p1.id);
    expect(ptest2.id, ptest1.id);
    expect(ptest2.name, ptest1.name);
  });
}
