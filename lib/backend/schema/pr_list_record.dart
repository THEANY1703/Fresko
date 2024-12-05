import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PrListRecord extends FirestoreRecord {
  PrListRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "TotalIngres" field.
  int? _totalIngres;
  int get totalIngres => _totalIngres ?? 0;
  bool hasTotalIngres() => _totalIngres != null;

  // "ReferenceEvent" field.
  DocumentReference? _referenceEvent;
  DocumentReference? get referenceEvent => _referenceEvent;
  bool hasReferenceEvent() => _referenceEvent != null;

  // "Organization" field.
  DocumentReference? _organization;
  DocumentReference? get organization => _organization;
  bool hasOrganization() => _organization != null;

  // "Members" field.
  List<DocumentReference>? _members;
  List<DocumentReference> get members => _members ?? const [];
  bool hasMembers() => _members != null;

  // "IngressMembers" field.
  List<DocumentReference>? _ingressMembers;
  List<DocumentReference> get ingressMembers => _ingressMembers ?? const [];
  bool hasIngressMembers() => _ingressMembers != null;

  // "Editor" field.
  List<DocumentReference>? _editor;
  List<DocumentReference> get editor => _editor ?? const [];
  bool hasEditor() => _editor != null;

  // "OrganizerOwner" field.
  DocumentReference? _organizerOwner;
  DocumentReference? get organizerOwner => _organizerOwner;
  bool hasOrganizerOwner() => _organizerOwner != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _totalIngres = castToType<int>(snapshotData['TotalIngres']);
    _referenceEvent = snapshotData['ReferenceEvent'] as DocumentReference?;
    _organization = snapshotData['Organization'] as DocumentReference?;
    _members = getDataList(snapshotData['Members']);
    _ingressMembers = getDataList(snapshotData['IngressMembers']);
    _editor = getDataList(snapshotData['Editor']);
    _organizerOwner = snapshotData['OrganizerOwner'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('PrList');

  static Stream<PrListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PrListRecord.fromSnapshot(s));

  static Future<PrListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PrListRecord.fromSnapshot(s));

  static PrListRecord fromSnapshot(DocumentSnapshot snapshot) => PrListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PrListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PrListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PrListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PrListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPrListRecordData({
  String? name,
  int? totalIngres,
  DocumentReference? referenceEvent,
  DocumentReference? organization,
  DocumentReference? organizerOwner,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'TotalIngres': totalIngres,
      'ReferenceEvent': referenceEvent,
      'Organization': organization,
      'OrganizerOwner': organizerOwner,
    }.withoutNulls,
  );

  return firestoreData;
}

class PrListRecordDocumentEquality implements Equality<PrListRecord> {
  const PrListRecordDocumentEquality();

  @override
  bool equals(PrListRecord? e1, PrListRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.totalIngres == e2?.totalIngres &&
        e1?.referenceEvent == e2?.referenceEvent &&
        e1?.organization == e2?.organization &&
        listEquality.equals(e1?.members, e2?.members) &&
        listEquality.equals(e1?.ingressMembers, e2?.ingressMembers) &&
        listEquality.equals(e1?.editor, e2?.editor) &&
        e1?.organizerOwner == e2?.organizerOwner;
  }

  @override
  int hash(PrListRecord? e) => const ListEquality().hash([
        e?.name,
        e?.totalIngres,
        e?.referenceEvent,
        e?.organization,
        e?.members,
        e?.ingressMembers,
        e?.editor,
        e?.organizerOwner
      ]);

  @override
  bool isValidKey(Object? o) => o is PrListRecord;
}
