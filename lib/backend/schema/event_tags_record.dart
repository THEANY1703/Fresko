import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventTagsRecord extends FirestoreRecord {
  EventTagsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "tag" field.
  List<DocumentReference>? _tag;
  List<DocumentReference> get tag => _tag ?? const [];
  bool hasTag() => _tag != null;

  // "event" field.
  DocumentReference? _event;
  DocumentReference? get event => _event;
  bool hasEvent() => _event != null;

  void _initializeFields() {
    _tag = getDataList(snapshotData['tag']);
    _event = snapshotData['event'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('EventTags');

  static Stream<EventTagsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventTagsRecord.fromSnapshot(s));

  static Future<EventTagsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventTagsRecord.fromSnapshot(s));

  static EventTagsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EventTagsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventTagsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventTagsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventTagsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventTagsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventTagsRecordData({
  DocumentReference? event,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'event': event,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventTagsRecordDocumentEquality implements Equality<EventTagsRecord> {
  const EventTagsRecordDocumentEquality();

  @override
  bool equals(EventTagsRecord? e1, EventTagsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.tag, e2?.tag) && e1?.event == e2?.event;
  }

  @override
  int hash(EventTagsRecord? e) => const ListEquality().hash([e?.tag, e?.event]);

  @override
  bool isValidKey(Object? o) => o is EventTagsRecord;
}
