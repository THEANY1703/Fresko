import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TablesRecord extends FirestoreRecord {
  TablesRecord._(
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

  // "IsApproved" field.
  bool? _isApproved;
  bool get isApproved => _isApproved ?? false;
  bool hasIsApproved() => _isApproved != null;

  // "TypeTable" field.
  TableType? _typeTable;
  TableType? get typeTable => _typeTable;
  bool hasTypeTable() => _typeTable != null;

  // "Members" field.
  List<DocumentReference>? _members;
  List<DocumentReference> get members => _members ?? const [];
  bool hasMembers() => _members != null;

  // "Capacity" field.
  int? _capacity;
  int get capacity => _capacity ?? 0;
  bool hasCapacity() => _capacity != null;

  // "IsFull" field.
  bool? _isFull;
  bool get isFull => _isFull ?? false;
  bool hasIsFull() => _isFull != null;

  void _initializeFields() {
    _title = snapshotData['Title'] as String?;
    _price = castToType<double>(snapshotData['Price']);
    _event = snapshotData['Event'] as DocumentReference?;
    _prList = snapshotData['PrList'] as DocumentReference?;
    _isApproved = snapshotData['IsApproved'] as bool?;
    _typeTable = deserializeEnum<TableType>(snapshotData['TypeTable']);
    _members = getDataList(snapshotData['Members']);
    _capacity = castToType<int>(snapshotData['Capacity']);
    _isFull = snapshotData['IsFull'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Tables');

  static Stream<TablesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TablesRecord.fromSnapshot(s));

  static Future<TablesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TablesRecord.fromSnapshot(s));

  static TablesRecord fromSnapshot(DocumentSnapshot snapshot) => TablesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TablesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TablesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TablesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TablesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTablesRecordData({
  String? title,
  double? price,
  DocumentReference? event,
  DocumentReference? prList,
  bool? isApproved,
  TableType? typeTable,
  int? capacity,
  bool? isFull,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Title': title,
      'Price': price,
      'Event': event,
      'PrList': prList,
      'IsApproved': isApproved,
      'TypeTable': typeTable,
      'Capacity': capacity,
      'IsFull': isFull,
    }.withoutNulls,
  );

  return firestoreData;
}

class TablesRecordDocumentEquality implements Equality<TablesRecord> {
  const TablesRecordDocumentEquality();

  @override
  bool equals(TablesRecord? e1, TablesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.price == e2?.price &&
        e1?.event == e2?.event &&
        e1?.prList == e2?.prList &&
        e1?.isApproved == e2?.isApproved &&
        e1?.typeTable == e2?.typeTable &&
        listEquality.equals(e1?.members, e2?.members) &&
        e1?.capacity == e2?.capacity &&
        e1?.isFull == e2?.isFull;
  }

  @override
  int hash(TablesRecord? e) => const ListEquality().hash([
        e?.title,
        e?.price,
        e?.event,
        e?.prList,
        e?.isApproved,
        e?.typeTable,
        e?.members,
        e?.capacity,
        e?.isFull
      ]);

  @override
  bool isValidKey(Object? o) => o is TablesRecord;
}
