import 'package:collection/collection.dart';

enum Role {
  User,
  Pr,
  Organaizer,
  Approver,
  OwnerOrganization,
  Admin,
  SemiGod,
  God,
}

enum TicketType {
  Normale,
  Vip,
}

enum TableType {
  TableNormal,
  TableVip,
  TablePremium,
  TableRegia,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (Role):
      return Role.values.deserialize(value) as T?;
    case (TicketType):
      return TicketType.values.deserialize(value) as T?;
    case (TableType):
      return TableType.values.deserialize(value) as T?;
    default:
      return null;
  }
}
