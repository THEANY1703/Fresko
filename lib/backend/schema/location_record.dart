import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocationRecord extends FirestoreRecord {
  LocationRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "DisplayName" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "coordinates" field.
  LatLng? _coordinates;
  LatLng? get coordinates => _coordinates;
  bool hasCoordinates() => _coordinates != null;

  // "Events" field.
  DocumentReference? _events;
  DocumentReference? get events => _events;
  bool hasEvents() => _events != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Image" field.
  List<String>? _image;
  List<String> get image => _image ?? const [];
  bool hasImage() => _image != null;

  // "Social" field.
  List<String>? _social;
  List<String> get social => _social ?? const [];
  bool hasSocial() => _social != null;

  // "Address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  void _initializeFields() {
    _displayName = snapshotData['DisplayName'] as String?;
    _coordinates = snapshotData['coordinates'] as LatLng?;
    _events = snapshotData['Events'] as DocumentReference?;
    _name = snapshotData['Name'] as String?;
    _image = getDataList(snapshotData['Image']);
    _social = getDataList(snapshotData['Social']);
    _address = snapshotData['Address'] as String?;
    _description = snapshotData['Description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Location');

  static Stream<LocationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LocationRecord.fromSnapshot(s));

  static Future<LocationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LocationRecord.fromSnapshot(s));

  static LocationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LocationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LocationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LocationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LocationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LocationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLocationRecordData({
  String? displayName,
  LatLng? coordinates,
  DocumentReference? events,
  String? name,
  String? address,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'DisplayName': displayName,
      'coordinates': coordinates,
      'Events': events,
      'Name': name,
      'Address': address,
      'Description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class LocationRecordDocumentEquality implements Equality<LocationRecord> {
  const LocationRecordDocumentEquality();

  @override
  bool equals(LocationRecord? e1, LocationRecord? e2) {
    const listEquality = ListEquality();
    return e1?.displayName == e2?.displayName &&
        e1?.coordinates == e2?.coordinates &&
        e1?.events == e2?.events &&
        e1?.name == e2?.name &&
        listEquality.equals(e1?.image, e2?.image) &&
        listEquality.equals(e1?.social, e2?.social) &&
        e1?.address == e2?.address &&
        e1?.description == e2?.description;
  }

  @override
  int hash(LocationRecord? e) => const ListEquality().hash([
        e?.displayName,
        e?.coordinates,
        e?.events,
        e?.name,
        e?.image,
        e?.social,
        e?.address,
        e?.description
      ]);

  @override
  bool isValidKey(Object? o) => o is LocationRecord;
}
