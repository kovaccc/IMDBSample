abstract class Persistable<DomainType> {
  DomainType asDomain();
}

extension DatabaseList<T> on List<Persistable<T>> {
  List<T> asDomain() {
    final domainEntities = <T>[];
    forEach((element) {
      domainEntities.add(element.asDomain());
    });
    return domainEntities;
  }
}
