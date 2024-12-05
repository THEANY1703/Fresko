import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TagRecord extends FirestoreRecord {
  TagRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "DispalyName" field.
  String? _dispalyName;
  String get dispalyName => _dispalyName ?? '';
  bool hasDispalyName() => _dispalyName != null;

  // "Events" field.
  DocumentReference? _events;
  DocumentReference? get events => _events;
  bool hasEvents() => _events != null;

  // "Descripton" field.
  String? _descripton;
  String get descripton => _descripton ?? '';
  bool hasDescripton() => _descripton != null;

  void _initializeFields() {
    _dispalyName = snapshotData['DispalyName'] as String?;
    _events = snapshotData['Events'] as DocumentReference?;
    _descripton = snapshotData['Descripton'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Tag');

  static Stream<TagRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TagRecord.fromSnapshot(s));

  static Future<TagRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TagRecord.fromSnapshot(s));

  static TagRecord fromSnapshot(DocumentSnapshot snapshot) => TagRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TagRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TagRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TagRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TagRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTagRecordData({
  String? dispalyName,
  DocumentReference? events,
  String? descripton,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'DispalyName': dispalyName,
      'Events': events,
      'Descripton': descripton,
    }.withoutNulls,
  );

  return firestoreData;
}

class TagRecordDocumentEquality implements Equality<TagRecord> {
  const TagRecordDocumentEquality();

  @override
  bool equals(TagRecord? e1, TagRecord? e2) {
    return e1?.dispalyName == e2?.dispalyName &&
        e1?.events == e2?.events &&
        e1?.descripton == e2?.descripton;
  }

  @override
  int hash(TagRecord? e) =>
      const ListEquality().hash([e?.dispalyName, e?.events, e?.descripton]);

  @override
  bool isValidKey(Object? o) => o is TagRecord;
}
