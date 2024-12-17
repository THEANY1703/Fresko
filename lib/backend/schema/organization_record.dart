import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrganizationRecord extends FirestoreRecord {
  OrganizationRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "Events" field.
  List<DocumentReference>? _events;
  List<DocumentReference> get events => _events ?? const [];
  bool hasEvents() => _events != null;

  // "Social" field.
  List<String>? _social;
  List<String> get social => _social ?? const [];
  bool hasSocial() => _social != null;

  // "Members" field.
  List<DocumentReference>? _members;
  List<DocumentReference> get members => _members ?? const [];
  bool hasMembers() => _members != null;

  // "Owner" field.
  List<DocumentReference>? _owner;
  List<DocumentReference> get owner => _owner ?? const [];
  bool hasOwner() => _owner != null;

  // "Liked" field.
  List<DocumentReference>? _liked;
  List<DocumentReference> get liked => _liked ?? const [];
  bool hasLiked() => _liked != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _logo = snapshotData['logo'] as String?;
    _bio = snapshotData['bio'] as String?;
    _events = getDataList(snapshotData['Events']);
    _social = getDataList(snapshotData['Social']);
    _members = getDataList(snapshotData['Members']);
    _owner = getDataList(snapshotData['Owner']);
    _liked = getDataList(snapshotData['Liked']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Organization');

  static Stream<OrganizationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrganizationRecord.fromSnapshot(s));

  static Future<OrganizationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrganizationRecord.fromSnapshot(s));

  static OrganizationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OrganizationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrganizationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrganizationRecord._(reference, mapFromFirestore(data));

  static OrganizationRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      OrganizationRecord.getDocumentFromData(
        {
          'Name': snapshot.data['Name'],
          'logo': snapshot.data['logo'],
          'bio': snapshot.data['bio'],
          'Events': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['Events'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'Social': safeGet(
            () => snapshot.data['Social'].toList(),
          ),
          'Members': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['Members'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'Owner': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['Owner'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'Liked': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['Liked'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
        },
        OrganizationRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<OrganizationRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'Organization',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'OrganizationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrganizationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrganizationRecordData({
  String? name,
  String? logo,
  String? bio,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'logo': logo,
      'bio': bio,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrganizationRecordDocumentEquality
    implements Equality<OrganizationRecord> {
  const OrganizationRecordDocumentEquality();

  @override
  bool equals(OrganizationRecord? e1, OrganizationRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.logo == e2?.logo &&
        e1?.bio == e2?.bio &&
        listEquality.equals(e1?.events, e2?.events) &&
        listEquality.equals(e1?.social, e2?.social) &&
        listEquality.equals(e1?.members, e2?.members) &&
        listEquality.equals(e1?.owner, e2?.owner) &&
        listEquality.equals(e1?.liked, e2?.liked);
  }

  @override
  int hash(OrganizationRecord? e) => const ListEquality().hash([
        e?.name,
        e?.logo,
        e?.bio,
        e?.events,
        e?.social,
        e?.members,
        e?.owner,
        e?.liked
      ]);

  @override
  bool isValidKey(Object? o) => o is OrganizationRecord;
}
