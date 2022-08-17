abstract class DomainData<DatabaseType> {
  DatabaseType asDatabase();
}

extension DomainList<T> on List<DomainData<T>> {
  List<T> asDatabase() {
    final dbEntities = <T>[];
    forEach((element) {
      dbEntities.add(element.asDatabase());
    });
    return dbEntities;
  }
}
