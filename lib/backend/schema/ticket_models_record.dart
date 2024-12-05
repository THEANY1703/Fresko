import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TicketModelsRecord extends FirestoreRecord {
  TicketModelsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Type" field.
  TicketType? _type;
  TicketType? get type => _type;
  bool hasType() => _type != null;

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

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _type = deserializeEnum<TicketType>(snapshotData['Type']);
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _price = castToType<double>(snapshotData['price']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('TicketModels')
          : FirebaseFirestore.instance.collectionGroup('TicketModels');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('TicketModels').doc(id);

  static Stream<TicketModelsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TicketModelsRecord.fromSnapshot(s));

  static Future<TicketModelsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TicketModelsRecord.fromSnapshot(s));

  static TicketModelsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TicketModelsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TicketModelsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TicketModelsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TicketModelsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TicketModelsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTicketModelsRecordData({
  String? name,
  TicketType? type,
  String? title,
  String? description,
  double? price,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'Type': type,
      'title': title,
      'description': description,
      'price': price,
    }.withoutNulls,
  );

  return firestoreData;
}

class TicketModelsRecordDocumentEquality
    implements Equality<TicketModelsRecord> {
  const TicketModelsRecordDocumentEquality();

  @override
  bool equals(TicketModelsRecord? e1, TicketModelsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.type == e2?.type &&
        e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.price == e2?.price;
  }

  @override
  int hash(TicketModelsRecord? e) => const ListEquality()
      .hash([e?.name, e?.type, e?.title, e?.description, e?.price]);

  @override
  bool isValidKey(Object? o) => o is TicketModelsRecord;
}
