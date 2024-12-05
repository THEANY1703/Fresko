import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventRecord extends FirestoreRecord {
  EventRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "DateEvent" field.
  DateTime? _dateEvent;
  DateTime? get dateEvent => _dateEvent;
  bool hasDateEvent() => _dateEvent != null;

  // "Location" field.
  DocumentReference? _location;
  DocumentReference? get location => _location;
  bool hasLocation() => _location != null;

  // "Participants" field.
  List<DocumentReference>? _participants;
  List<DocumentReference> get participants => _participants ?? const [];
  bool hasParticipants() => _participants != null;

  // "totalParticipants" field.
  int? _totalParticipants;
  int get totalParticipants => _totalParticipants ?? 0;
  bool hasTotalParticipants() => _totalParticipants != null;

  // "organizers" field.
  List<DocumentReference>? _organizers;
  List<DocumentReference> get organizers => _organizers ?? const [];
  bool hasOrganizers() => _organizers != null;

  // "creationAt" field.
  DateTime? _creationAt;
  DateTime? get creationAt => _creationAt;
  bool hasCreationAt() => _creationAt != null;

  // "social" field.
  List<String>? _social;
  List<String> get social => _social ?? const [];
  bool hasSocial() => _social != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "Images" field.
  String? _images;
  String get images => _images ?? '';
  bool hasImages() => _images != null;

  // "Owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "EventTags" field.
  DocumentReference? _eventTags;
  DocumentReference? get eventTags => _eventTags;
  bool hasEventTags() => _eventTags != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _dateEvent = snapshotData['DateEvent'] as DateTime?;
    _location = snapshotData['Location'] as DocumentReference?;
    _participants = getDataList(snapshotData['Participants']);
    _totalParticipants = castToType<int>(snapshotData['totalParticipants']);
    _organizers = getDataList(snapshotData['organizers']);
    _creationAt = snapshotData['creationAt'] as DateTime?;
    _social = getDataList(snapshotData['social']);
    _description = snapshotData['description'] as String?;
    _images = snapshotData['Images'] as String?;
    _owner = snapshotData['Owner'] as DocumentReference?;
    _eventTags = snapshotData['EventTags'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Event');

  static Stream<EventRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventRecord.fromSnapshot(s));

  static Future<EventRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventRecord.fromSnapshot(s));

  static EventRecord fromSnapshot(DocumentSnapshot snapshot) => EventRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventRecordData({
  String? name,
  DateTime? dateEvent,
  DocumentReference? location,
  int? totalParticipants,
  DateTime? creationAt,
  String? description,
  String? images,
  DocumentReference? owner,
  DocumentReference? eventTags,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'DateEvent': dateEvent,
      'Location': location,
      'totalParticipants': totalParticipants,
      'creationAt': creationAt,
      'description': description,
      'Images': images,
      'Owner': owner,
      'EventTags': eventTags,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventRecordDocumentEquality implements Equality<EventRecord> {
  const EventRecordDocumentEquality();

  @override
  bool equals(EventRecord? e1, EventRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.dateEvent == e2?.dateEvent &&
        e1?.location == e2?.location &&
        listEquality.equals(e1?.participants, e2?.participants) &&
        e1?.totalParticipants == e2?.totalParticipants &&
        listEquality.equals(e1?.organizers, e2?.organizers) &&
        e1?.creationAt == e2?.creationAt &&
        listEquality.equals(e1?.social, e2?.social) &&
        e1?.description == e2?.description &&
        e1?.images == e2?.images &&
        e1?.owner == e2?.owner &&
        e1?.eventTags == e2?.eventTags;
  }

  @override
  int hash(EventRecord? e) => const ListEquality().hash([
        e?.name,
        e?.dateEvent,
        e?.location,
        e?.participants,
        e?.totalParticipants,
        e?.organizers,
        e?.creationAt,
        e?.social,
        e?.description,
        e?.images,
        e?.owner,
        e?.eventTags
      ]);

  @override
  bool isValidKey(Object? o) => o is EventRecord;
}
