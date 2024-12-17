import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TicketRecord extends FirestoreRecord {
  TicketRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "Price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "Event" field.
  DocumentReference? _event;
  DocumentReference? get event => _event;
  bool hasEvent() => _event != null;

  // "PrList" field.
  DocumentReference? _prList;
  DocumentReference? get prList => _prList;
  bool hasPrList() => _prList != null;

  // "UniqueCode" field.
  String? _uniqueCode;
  String get uniqueCode => _uniqueCode ?? '';
  bool hasUniqueCode() => _uniqueCode != null;

  // "IsApproved" field.
  bool? _isApproved;
  bool get isApproved => _isApproved ?? false;
  bool hasIsApproved() => _isApproved != null;

  // "User" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "TypeTable" field.
  TableType? _typeTable;
  TableType? get typeTable => _typeTable;
  bool hasTypeTable() => _typeTable != null;

  // "TypeTicket" field.
  TicketType? _typeTicket;
  TicketType? get typeTicket => _typeTicket;
  bool hasTypeTicket() => _typeTicket != null;

  // "Table" field.
  DocumentReference? _table;
  DocumentReference? get table => _table;
  bool hasTable() => _table != null;

  void _initializeFields() {
    _title = snapshotData['Title'] as String?;
    _price = castToType<double>(snapshotData['Price']);
    _event = snapshotData['Event'] as DocumentReference?;
    _prList = snapshotData['PrList'] as DocumentReference?;
    _uniqueCode = snapshotData['UniqueCode'] as String?;
    _isApproved = snapshotData['IsApproved'] as bool?;
    _user = snapshotData['User'] as DocumentReference?;
    _typeTable = snapshotData['TypeTable'] is TableType
        ? snapshotData['TypeTable']
        : deserializeEnum<TableType>(snapshotData['TypeTable']);
    _typeTicket = snapshotData['TypeTicket'] is TicketType
        ? snapshotData['TypeTicket']
        : deserializeEnum<TicketType>(snapshotData['TypeTicket']);
    _table = snapshotData['Table'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Ticket');

  static Stream<TicketRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TicketRecord.fromSnapshot(s));

  static Future<TicketRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TicketRecord.fromSnapshot(s));

  static TicketRecord fromSnapshot(DocumentSnapshot snapshot) => TicketRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TicketRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TicketRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TicketRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TicketRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTicketRecordData({
  String? title,
  double? price,
  DocumentReference? event,
  DocumentReference? prList,
  String? uniqueCode,
  bool? isApproved,
  DocumentReference? user,
  TableType? typeTable,
  TicketType? typeTicket,
  DocumentReference? table,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Title': title,
      'Price': price,
      'Event': event,
      'PrList': prList,
      'UniqueCode': uniqueCode,
      'IsApproved': isApproved,
      'User': user,
      'TypeTable': typeTable,
      'TypeTicket': typeTicket,
      'Table': table,
    }.withoutNulls,
  );

  return firestoreData;
}

class TicketRecordDocumentEquality implements Equality<TicketRecord> {
  const TicketRecordDocumentEquality();

  @override
  bool equals(TicketRecord? e1, TicketRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.price == e2?.price &&
        e1?.event == e2?.event &&
        e1?.prList == e2?.prList &&
        e1?.uniqueCode == e2?.uniqueCode &&
        e1?.isApproved == e2?.isApproved &&
        e1?.user == e2?.user &&
        e1?.typeTable == e2?.typeTable &&
        e1?.typeTicket == e2?.typeTicket &&
        e1?.table == e2?.table;
  }

  @override
  int hash(TicketRecord? e) => const ListEquality().hash([
        e?.title,
        e?.price,
        e?.event,
        e?.prList,
        e?.uniqueCode,
        e?.isApproved,
        e?.user,
        e?.typeTable,
        e?.typeTicket,
        e?.table
      ]);

  @override
  bool isValidKey(Object? o) => o is TicketRecord;
}
