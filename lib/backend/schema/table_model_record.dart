import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TableModelRecord extends FirestoreRecord {
  TableModelRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "type" field.
  TableType? _type;
  TableType? get type => _type;
  bool hasType() => _type != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _type = snapshotData['type'] is TableType
        ? snapshotData['type']
        : deserializeEnum<TableType>(snapshotData['type']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('TableModel')
          : FirebaseFirestore.instance.collectionGroup('TableModel');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('TableModel').doc(id);

  static Stream<TableModelRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TableModelRecord.fromSnapshot(s));

  static Future<TableModelRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TableModelRecord.fromSnapshot(s));

  static TableModelRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TableModelRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TableModelRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TableModelRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TableModelRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TableModelRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTableModelRecordData({
  String? name,
  String? title,
  String? description,
  double? price,
  TableType? type,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'title': title,
      'description': description,
      'price': price,
      'type': type,
    }.withoutNulls,
  );

  return firestoreData;
}

class TableModelRecordDocumentEquality implements Equality<TableModelRecord> {
  const TableModelRecordDocumentEquality();

  @override
  bool equals(TableModelRecord? e1, TableModelRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.price == e2?.price &&
        e1?.type == e2?.type;
  }

  @override
  int hash(TableModelRecord? e) => const ListEquality()
      .hash([e?.name, e?.title, e?.description, e?.price, e?.type]);

  @override
  bool isValidKey(Object? o) => o is TableModelRecord;
}
